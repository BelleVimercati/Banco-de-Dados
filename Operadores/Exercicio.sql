-- database: ./db.sqlite

--1 - Selecione todas as aulas do curso de html-para-iniciantes e ordene por lesson_order em ordem crescente.
SELECT * FROM lessons WHERE course_id = (SELECT id FROM courses WHERE slug = 'html-para-iniciantes') ORDER BY lesson_order DESC;

--2 - Somar o total de segundos das aulas do curso de css-animacoes.
SELECT SUM(seconds) FROM lessons WHERE course_id = (SELECT id FROM courses WHERE slug = 'css-animacoes');

--3 - Contar o total de aulas e agrupar por curso.
SELECT count(*) AS total_aulas, course_id FROM lessons GROUP BY course_id;

--4 - Somar o total de segundos das aulas, agrupar por curso e ordenar o total de segundos por ordem decrescente.
SELECT SUM(seconds) AS total_segundos, course_id FROM lessons GROUP BY course_id ORDER BY seconds DESC;

--5 - Utilize a query 4, e filtre apenas os cursos que possuem mais de 2300 segundos de aulas. Continue ordenando.
SELECT SUM(seconds) AS total_segundos, course_id 
FROM lessons GROUP BY course_id  
HAVING total_segundos > 2300
ORDER BY seconds DESC;

--6 - Utilize a query 4, mostre o título do curso no lugar do course_id.
SELECT SUM(ls.seconds) AS total_segundos, courses.title
FROM lessons AS ls 
JOIN courses ON ls.course_id = courses.id
GROUP BY course_id
ORDER BY seconds DESC;

-- 7 - Selecione o ID dos certificados de mariana@email.com
SELECT id FROM certificates WHERE user_id = (SELECT id FROM users WHERE email = 'mariana@email.com');

-- 8 - Selecione todas as aulas completas ou não pelo usuário lucas@email.com. Mostre o título da aula e se está completa ou não.
SELECT l.title, l.materia, lc.completed FROM lessons AS l
LEFT JOIN lessons_completed AS lc ON l.id = lc.lesson_id
WHERE lc.user_id = (SELECT id FROM users WHERE email = 'lucas@email.com');

-- 9 - Selecione as aulas anterior/próxima da aula funcoes-e-escopo. Retorne 3 aulas (se existirem): a anterior, a atual e a próxima. Utilize o lesson_order para isso.
SELECT * FROM lessons 
WHERE course_id = (SELECT course_id FROM lessons WHERE slug = 'funcoes-e-escopo')
AND lesson_order 
IN (
  (SELECT lesson_order FROM lessons WHERE slug = 'funcoes-e-escopo') -1,
  (SELECT lesson_order FROM lessons WHERE slug = 'funcoes-e-escopo'),
  (SELECT lesson_order FROM lessons WHERE slug = 'funcoes-e-escopo') +1
)
ORDER BY lesson_order;


WITH current AS (
  SELECT course_id, lesson_order FROM lessons WHERE slug = 'funcoes-e-escopo'
  )
SELECT * FROM lessons 
WHERE course_id = (SELECT course_id FROM current)
AND lesson_order 
IN (
  (SELECT lesson_order FROM current) -1,
  (SELECT lesson_order FROM current),
  (SELECT lesson_order FROM current) +1
)
ORDER BY lesson_order;
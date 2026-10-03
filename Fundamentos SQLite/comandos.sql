-- database: ./db.sqlite

/* Criando uma tabela */
CREATE TABLE cursos (
  id INTEGER NOT NULL,
  nome TEXT NOT NULL,
  aulas INTEGER
);

/* Comando para revisar os atributos de uma tabela */
PRAGMA TABLE_INFO('cursos');

INSERT INTO
  cursos (id, nome, aulas)
VALUES
  (1, 'HTML', 10),
  (2, 'CSS', 20);


-- database: ./db.sqlite

/* Criando as tabelas do exercício */

/* O modo strict (estrito) em bancos de dados NoSQL (como no Mongoose para MongoDB) serve para garantir que apenas os campos definidos no seu esquema (schema) sejam salvos no banco de dados, ignorando ou rejeitando campos extras enviados por engano ou por malícia. 

A cláusula COLLATE NOCASE no SQL serve para fazer com que as comparações de texto ignorem a diferença entre letras maiúsculas e minúsculas (case-insensitive).
*/
CREATE TABLE "user" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT NOT NULL,
  "password" TEXT NOT NULL,
  "email" TEXT NOT NULL COLLATE NOCASE UNIQUE,
  "created" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
) STRICT;

CREATE TABLE "courses" (
  id INTEGER PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE COLLATE NOCASE,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  aulas INTEGER NOT NULL,
  horas INTEGER NOT NULL,
  "created" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
) STRICT;

CREATE TABLE lessons (
  id INTEGER NOT NULL PRIMARY KEY,
  course_id INTEGER NOT NULL,
  slug TEXT NOT NULL COLLATE NOCASE,
  title TEXT UNIQUE NOT NULL,
  materia TEXT NOT NULL,
  materia_slug TEXT NOT NULL UNIQUE,
  seconds INTEGER NOT NULL,
  video TEXT NOT NULL,
  description TEXT NOT NULL,
  lesson_order TEXT NOT NULL UNIQUE,
  free INTEGER NOT NULL DEFAULT 0 CHECK ('free' IN (0, 1)),
  "created" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY ("course_id") REFERENCES "cousers" ("id"),
  UNIQUE ("course_id", "id")
) STRICT;

CREATE TABLE lessonsCompleted (
  user_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  lesson_id INTEGER NOT NULL,
  completed TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id, course_id, lesson_id),
  FOREIGN KEY ("user_id") REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES course (id),
  FOREIGN KEY (lesson_id) REFERENCES lessons (id)
) STRICT;

CREATE TABLE certificates (
  id TEXT PRIMARY KEY,
  user_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  completed TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (user_id, course_id) FOREIGN KEY (user_id) REFERENCES USER(id) ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES courses (id)
) STRICT;
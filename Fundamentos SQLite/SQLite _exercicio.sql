-- database: ./db.sqlite

/* Criando as tabelas */
CREATE TABLE produtos (
  id INTEGER NOT NULL,
  nome TEXT NOT NULL,
  preco INTEGER NOT NULL
); 

CREATE TABLE clientes (
  id INTEGER NOT NULL,
  nome TEXT NOT NULL,
  email TEXT NOT NULL
);

CREATE TABLE compras (
  id INTEGER NOT NULL,
  client_id INTEGER NOT NULL,
  produto_id INTEGER NOT NULL,
  data TEXT NOT NULL
);

/* Populando as tabelas */
INSERT INTO
  "produtos" (id, nome, preco)
VALUES
  (1, 'Notebook', 1000),
  (2, 'Smartphone', 500),
  (3, 'Tablet', 300);

INSERT INTO
  "clientes" (id, nome, email)
VALUES
  (1, 'Maria', 'maria@email.com'),
  (2, 'João', 'joao@email.com');

/* O exercício pedia o seguinte enunciado:
João comprou o Notebook no dia 2049-01-01
Maria comprou o Smartphone no dia 2049-01-02
João comprou o Tablet no dia 2049-01-03
*/
INSERT INTO
  "compras" (id, client_id, produto_id, "data")
VALUES
  (1, 1, 1, '2049-01-01'),
  (2, 2, 2, '2049-01-02'),
  (3, 1, 3, '2049-01-03');
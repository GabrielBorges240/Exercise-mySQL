/*
==========================================================
 CS50 SQL – Aula 3: Writing (Escrevendo)
==========================================================

 O QUE É?
 Aprendemos a ESCREVER no banco: inserir, atualizar e apagar
 linhas. Juntos com o SELECT formam o "CRUD":
   Create (INSERT), Read (SELECT), Update (UPDATE),
   Delete (DELETE).

==========================================================
*/


-- ----------------------------------------------------------
-- 1) INSERT INTO
-- ----------------------------------------------------------

-- Uma linha
INSERT INTO "alunos" ("name", "email")
VALUES ('Gabriel', 'gabriel@email.com');

-- Várias linhas de uma vez
INSERT INTO "alunos" ("name", "email")
VALUES
    ('Ana',   'ana@email.com'),
    ('Bruno', 'bruno@email.com');

-- Colunas omitidas recebem NULL ou o valor DEFAULT.

-- Inserir com dados vindos de um SELECT
INSERT INTO "ex_alunos" ("name", "email")
SELECT "name", "email" FROM "alunos" WHERE "id" > 100;


-- ----------------------------------------------------------
-- 2) IMPORTAR UM CSV (no terminal do SQLite, não é SQL)
-- ----------------------------------------------------------
-- .import --csv --skip 1 arquivo.csv tabela
--   --csv     = o arquivo é CSV
--   --skip 1  = ignora a primeira linha (cabeçalho)
-- Dica: importe para uma tabela temporária, limpe os dados
-- e depois copie para a tabela final com INSERT ... SELECT.


-- ----------------------------------------------------------
-- 3) DELETE
--    SEM WHERE, apaga TODAS as linhas!
-- ----------------------------------------------------------

DELETE FROM "alunos" WHERE "id" = 3;

DELETE FROM "alunos" WHERE "email" IS NULL;

-- Com chave estrangeira, o comportamento depende do ON DELETE
-- (RESTRICT, SET NULL, SET DEFAULT, CASCADE).
-- No SQLite é preciso ativar:
PRAGMA foreign_keys = ON;


-- ----------------------------------------------------------
-- 4) UPDATE
--    Também use WHERE, senão altera TODAS as linhas!
-- ----------------------------------------------------------

UPDATE "alunos"
SET "email" = 'novo@email.com'
WHERE "id" = 1;

-- Atualizar várias colunas
UPDATE "alunos"
SET "name" = 'Gabriel Borges', "email" = 'gb@email.com'
WHERE "id" = 1;

-- Atualizar usando cálculo
UPDATE "products"
SET "price" = "price" * 1.10
WHERE "category" = 'food';


-- ----------------------------------------------------------
-- 5) TRIGGERS (gatilhos)
--    Código que roda AUTOMATICAMENTE quando acontece um
--    INSERT, UPDATE ou DELETE.
-- ----------------------------------------------------------

-- Ao apagar um livro, registra o fato numa tabela de log
CREATE TRIGGER "log_exclusao"
BEFORE DELETE ON "books"
FOR EACH ROW
BEGIN
    INSERT INTO "log" ("acao", "titulo")
    VALUES ('apagado', OLD."title");
END;

-- Dentro do trigger:
--   NEW = os valores novos (INSERT / UPDATE)
--   OLD = os valores antigos (DELETE / UPDATE)

DROP TRIGGER "log_exclusao";


-- ----------------------------------------------------------
-- 6) SOFT DELETE (exclusão "suave")
--    Em vez de apagar de verdade, marca a linha como apagada.
--    Assim dá para recuperar depois.
-- ----------------------------------------------------------

ALTER TABLE "books" ADD COLUMN "deleted" INTEGER DEFAULT 0;

-- "Apagar"
UPDATE "books" SET "deleted" = 1 WHERE "id" = 5;

-- Consultar só os que NÃO foram apagados
SELECT * FROM "books" WHERE "deleted" = 0;


/*
==========================================================
 DICAS PARA OS EXERCÍCIOS DA SEMANA 3
 (Don't Panic / Meteorites Cleanup)

 - Faça BACKUP do .db antes de DELETE ou UPDATE.
 - Teste o WHERE com um SELECT antes de trocar por
   DELETE ou UPDATE.
 - Para limpar dados: importe o CSV, depois use UPDATE
   (arredondar, trocar vazio por NULL) e DELETE
   (remover linhas inválidas).
 - Lembre: sem WHERE, o comando afeta a tabela inteira.
==========================================================
*/

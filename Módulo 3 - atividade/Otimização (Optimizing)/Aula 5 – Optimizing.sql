/*
==========================================================
 CS50 SQL – Aula 5: Optimizing (Otimizando)
==========================================================

 O QUE É?
 Como deixar as consultas mais RÁPIDAS (índices) e como
 garantir que várias operações aconteçam com segurança
 (transações).

==========================================================
*/


-- ----------------------------------------------------------
-- 1) EXPLAIN QUERY PLAN
--    Mostra COMO o banco vai executar a consulta.
--      SCAN   = lê a tabela inteira (lento)
--      SEARCH = usa um índice (rápido)
-- ----------------------------------------------------------

EXPLAIN QUERY PLAN
SELECT "title" FROM "books" WHERE "year" = 2023;


-- ----------------------------------------------------------
-- 2) ÍNDICES (INDEX)
--    Estrutura extra (uma árvore B) que acelera a busca,
--    como o índice de um livro.
--    Trade-off: ocupa espaço e deixa INSERT/UPDATE/DELETE
--    um pouco mais lentos.
-- ----------------------------------------------------------

CREATE INDEX "idx_books_year" ON "books" ("year");

-- Rode o EXPLAIN de novo: agora deve aparecer SEARCH.
EXPLAIN QUERY PLAN
SELECT "title" FROM "books" WHERE "year" = 2023;

-- Apagar o índice
DROP INDEX "idx_books_year";

-- Chaves primárias já criam um índice automaticamente.


-- ----------------------------------------------------------
-- 3) ÍNDICE COMPOSTO (várias colunas)
-- ----------------------------------------------------------

CREATE INDEX "idx_year_rating" ON "books" ("year", "rating");


-- ----------------------------------------------------------
-- 4) COVERING INDEX (índice de cobertura)
--    Se o índice já tem TODAS as colunas que a consulta
--    precisa, o banco nem lê a tabela.
-- ----------------------------------------------------------

CREATE INDEX "idx_cobertura" ON "books" ("year", "title");

SELECT "title" FROM "books" WHERE "year" = 2023;


-- ----------------------------------------------------------
-- 5) ÍNDICE PARCIAL
--    Indexa só as linhas que interessam (economiza espaço).
-- ----------------------------------------------------------

CREATE INDEX "idx_recentes" ON "books" ("title")
WHERE "year" >= 2020;


-- ----------------------------------------------------------
-- 6) VACUUM
--    Compacta o arquivo .db e libera espaço não usado.
-- ----------------------------------------------------------

VACUUM;


-- ----------------------------------------------------------
-- 7) TRANSAÇÕES
--    Um grupo de comandos que vale "tudo ou nada".
--    Propriedades ACID:
--      Atomicidade   : ou executa tudo, ou nada
--      Consistência  : respeita as regras do banco
--      Isolamento    : transações não se atrapalham
--      Durabilidade  : depois do COMMIT, os dados ficam salvos
-- ----------------------------------------------------------

-- Exemplo: transferir 10 reais de uma conta para outra
BEGIN TRANSACTION;
UPDATE "accounts" SET "balance" = "balance" - 10 WHERE "id" = 1;
UPDATE "accounts" SET "balance" = "balance" + 10 WHERE "id" = 2;
COMMIT;

-- Se algo der errado no meio, desfaz tudo:
BEGIN TRANSACTION;
UPDATE "accounts" SET "balance" = "balance" - 10 WHERE "id" = 1;
ROLLBACK;


-- ----------------------------------------------------------
-- 8) CONCORRÊNCIA E RACE CONDITIONS
--    Se duas pessoas alteram o mesmo dado ao mesmo tempo,
--    podem ocorrer erros (ex.: dois clientes compram a última
--    unidade do estoque). Transações ajudam a evitar isso.
-- ----------------------------------------------------------


/*
==========================================================
 DICAS PARA OS EXERCÍCIOS DA SEMANA 5
 (In a Snap / your.harvard)

 - Use EXPLAIN QUERY PLAN para achar consultas lentas.
 - Crie índices nas colunas usadas em WHERE e em JOIN.
 - Compare o tempo antes e depois do índice
   (.timer on no terminal do SQLite).
 - Não crie índice em tudo: cada um tem custo.
 - Para operações que dependem umas das outras, use
   BEGIN TRANSACTION ... COMMIT.
==========================================================
*/

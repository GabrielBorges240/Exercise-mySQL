/*
==========================================================
 CS50 SQL – Aula 4: Viewing (Visualizando)
==========================================================

 O QUE É?
 Uma VIEW (visão) é uma consulta salva com um nome. Ela se
 comporta como uma tabela "virtual": não guarda dados, só a
 receita da consulta. Serve para simplificar, agregar e
 proteger dados.

==========================================================
*/


-- ----------------------------------------------------------
-- 1) CREATE VIEW (simplificando consultas)
-- ----------------------------------------------------------

CREATE VIEW "livros_e_autores" AS
SELECT "authors"."name", "books"."title"
FROM "authors"
JOIN "authored" ON "authored"."author_id" = "authors"."id"
JOIN "books"    ON "books"."id" = "authored"."book_id";

-- Agora é só usar como se fosse uma tabela
SELECT * FROM "livros_e_autores" WHERE "name" = 'Ana';

-- Apagar a view (os dados originais não são afetados)
DROP VIEW "livros_e_autores";


-- ----------------------------------------------------------
-- 2) VIEW PARA AGREGAR (resumos)
-- ----------------------------------------------------------

CREATE VIEW "media_por_ano" AS
SELECT "year", ROUND(AVG("rating"), 2) AS "media"
FROM "books"
GROUP BY "year";

SELECT * FROM "media_por_ano" ORDER BY "year";


-- ----------------------------------------------------------
-- 3) CTE – COMMON TABLE EXPRESSION (WITH)
--    Uma "view" que existe só durante UMA consulta.
-- ----------------------------------------------------------

WITH "caros" AS (
    SELECT "title", "price"
    FROM "books"
    WHERE "price" > 50
)
SELECT "title"
FROM "caros"
ORDER BY "price" DESC;


-- ----------------------------------------------------------
-- 4) VIEW TEMPORÁRIA
--    Existe só enquanto a conexão com o banco estiver aberta.
-- ----------------------------------------------------------

CREATE TEMPORARY VIEW "resumo_temp" AS
SELECT "year", COUNT(*) AS "total"
FROM "books"
GROUP BY "year";

-- Útil para "particionar" os dados e consultar por partes
-- (por exemplo, por ano ou por categoria).


-- ----------------------------------------------------------
-- 5) VIEW PARA PROTEGER DADOS (segurança)
--    Mostra só algumas colunas e esconde as sensíveis.
-- ----------------------------------------------------------

CREATE VIEW "usuarios_publico" AS
SELECT "id", "name"
FROM "users";
-- (a coluna "password" nem aparece na view)


-- ----------------------------------------------------------
-- 6) VIEW COM SOFT DELETE
--    Esconde as linhas marcadas como apagadas.
-- ----------------------------------------------------------

CREATE VIEW "livros_ativos" AS
SELECT * FROM "books" WHERE "deleted" = 0;


-- ----------------------------------------------------------
-- 7) COMANDOS ÚTEIS
-- ----------------------------------------------------------
-- .schema            mostra tabelas E views
-- .tables            lista tabelas e views


/*
==========================================================
 DICAS PARA OS EXERCÍCIOS DA SEMANA 4
 (Census / The Private Eye / Bed and Breakfast)

 - Se a consulta está grande e repetida, vire uma VIEW.
 - Para "esconder" parte do texto ou dos dados, a view
   pode usar funções como SUBSTR, REPLACE e ROUND.
 - Use ".schema" para ver as views que já existem.
 - A view mostra sempre os dados ATUAIS das tabelas.
==========================================================
*/

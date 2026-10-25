/*
==========================================================
 CS50 SQL – Aula 1: Relating (Relacionando)
==========================================================

 O QUE É?
 Um banco de dados RELACIONAL guarda dados em várias tabelas
 que se conectam entre si. Em vez de repetir informação,
 ligamos as tabelas por CHAVES.

 Os exemplos usam tabelas ilustrativas: "authors" (autores),
 "books" (livros) e "authored" (liga autor <-> livro).
 Use ".schema" para ver as tabelas reais do seu banco.

==========================================================
*/


-- ----------------------------------------------------------
-- 1) CHAVES
--    PRIMARY KEY = identifica UMA linha de forma única
--                  (ex.: "id" do autor).
--    FOREIGN KEY = coluna que aponta para a chave primária
--                  de OUTRA tabela (ex.: "author_id").
-- ----------------------------------------------------------


-- ----------------------------------------------------------
-- 2) TIPOS DE RELACIONAMENTO (diagrama ER)
--    Um-para-um      : 1 pessoa  <-> 1 passaporte
--    Um-para-muitos  : 1 editora <-> N livros
--    Muitos-para-muitos: N autores <-> N livros
--                      (precisa de uma tabela de junção,
--                       como "authored")
-- ----------------------------------------------------------


-- ----------------------------------------------------------
-- 3) SUBCONSULTAS (consulta dentro de consulta)
-- ----------------------------------------------------------

-- Livros de um autor, sem usar JOIN
SELECT "title"
FROM "books"
WHERE "id" IN (
    SELECT "book_id"
    FROM "authored"
    WHERE "author_id" = (
        SELECT "id"
        FROM "authors"
        WHERE "name" = 'Fernanda Melchor'
    )
);

-- IN = "está dentro desta lista de valores"


-- ----------------------------------------------------------
-- 4) JOIN
--    Junta linhas de tabelas diferentes usando a chave.
-- ----------------------------------------------------------

-- JOIN (ou INNER JOIN): só linhas que combinam nas DUAS tabelas
SELECT "authors"."name", "books"."title"
FROM "authors"
JOIN "authored" ON "authored"."author_id" = "authors"."id"
JOIN "books"    ON "books"."id" = "authored"."book_id";

-- LEFT JOIN: TODAS da esquerda + as que combinam da direita
-- (as sem par aparecem com NULL)
SELECT "authors"."name", "authored"."book_id"
FROM "authors"
LEFT JOIN "authored" ON "authored"."author_id" = "authors"."id";

-- RIGHT JOIN: o inverso do LEFT
-- FULL JOIN : todas de ambas as tabelas
-- (RIGHT e FULL existem no SQLite a partir da versão 3.39)

-- NATURAL JOIN: junta automaticamente colunas com o mesmo nome
SELECT "name", "title"
FROM "authors"
NATURAL JOIN "authored"
NATURAL JOIN "books";


-- ----------------------------------------------------------
-- 5) CONJUNTOS (combinam resultados de duas consultas)
--    As consultas precisam ter o mesmo nº de colunas.
-- ----------------------------------------------------------

-- UNION: junta tudo, sem repetir
SELECT "name" FROM "authors"
UNION
SELECT "name" FROM "translators";

-- INTERSECT: só o que aparece nas DUAS
SELECT "name" FROM "authors"
INTERSECT
SELECT "name" FROM "translators";

-- EXCEPT: o que está na primeira e NÃO na segunda
SELECT "name" FROM "authors"
EXCEPT
SELECT "name" FROM "translators";


-- ----------------------------------------------------------
-- 6) GROUP BY e HAVING
--    GROUP BY agrupa linhas; HAVING filtra os GRUPOS
--    (WHERE filtra linhas ANTES de agrupar).
-- ----------------------------------------------------------

-- Quantos livros cada autor tem?
SELECT "author_id", COUNT(*) AS "total_livros"
FROM "authored"
GROUP BY "author_id";

-- Só autores com mais de 1 livro
SELECT "author_id", COUNT(*) AS "total_livros"
FROM "authored"
GROUP BY "author_id"
HAVING "total_livros" > 1;


/*
==========================================================
 DICAS PARA OS EXERCÍCIOS DA SEMANA 1
 (Packages, Please / DESE / Moneyball)

 - Desenhe no papel as tabelas e quais colunas se ligam.
 - Primeiro ache as chaves (id) e depois monte o JOIN.
 - Se a resposta depende de outra consulta, pense em
   subconsulta ou JOIN.
 - "Para cada ..." / "por ..." costuma pedir GROUP BY.
 - "Mais de N ..." sobre grupos pede HAVING.
==========================================================
*/

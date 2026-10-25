/*
==========================================================
 CS50 SQL – Aula 0: Querying (Consultando)
==========================================================

 O QUE É?
 SQL (Structured Query Language) é a linguagem usada para
 conversar com bancos de dados. Nesta aula usamos o SQLite
 e aprendemos a LER dados de uma tabela (consultas).

 Os exemplos abaixo usam uma tabela chamada "longlist",
 com livros de uma premiação. Os nomes das colunas são
 ilustrativos: no seu banco, rode ".schema" no terminal
 para ver as colunas reais.

==========================================================
*/


-- ----------------------------------------------------------
-- 1) SELECT ... FROM
--    Escolhe QUAIS colunas ver e de QUAL tabela.
-- ----------------------------------------------------------

-- Todas as colunas (* = tudo)
SELECT * FROM "longlist";

-- Só algumas colunas
SELECT "title", "author" FROM "longlist";


-- ----------------------------------------------------------
-- 2) LIMIT
--    Limita quantas linhas aparecem (ótimo para tabelas grandes).
-- ----------------------------------------------------------

SELECT "title" FROM "longlist" LIMIT 10;


-- ----------------------------------------------------------
-- 3) WHERE
--    Filtra as linhas com uma condição.
--    Operadores: =  !=  <>  <  >  <=  >=  AND  OR  NOT
-- ----------------------------------------------------------

-- Livros de um ano específico
SELECT "title", "author"
FROM "longlist"
WHERE "year" = 2023;

-- Com AND (as duas condições precisam ser verdadeiras)
SELECT "title"
FROM "longlist"
WHERE "year" = 2022 AND "format" = 'hardcover';

-- Com OR (basta uma ser verdadeira)
SELECT "title"
FROM "longlist"
WHERE "year" = 2022 OR "year" = 2023;

-- Com NOT / diferente
SELECT "title" FROM "longlist" WHERE NOT "year" = 2023;


-- ----------------------------------------------------------
-- 4) NULL
--    NULL = "sem valor" (vazio). Não use "= NULL".
--    Use IS NULL ou IS NOT NULL.
-- ----------------------------------------------------------

-- Livros que NÃO têm tradutor
SELECT "title" FROM "longlist" WHERE "translator" IS NULL;

-- Livros que TÊM tradutor
SELECT "title", "translator"
FROM "longlist"
WHERE "translator" IS NOT NULL;


-- ----------------------------------------------------------
-- 5) LIKE
--    Busca por padrão de texto.
--      %  = qualquer quantidade de caracteres
--      _  = exatamente UM caractere
-- ----------------------------------------------------------

-- Títulos que contêm a palavra "love"
SELECT "title" FROM "longlist" WHERE "title" LIKE '%love%';

-- Títulos que começam com "The"
SELECT "title" FROM "longlist" WHERE "title" LIKE 'The%';

-- Palavra de 3 letras começando com "c" e terminando com "t" (cat, cut...)
SELECT "title" FROM "longlist" WHERE "title" LIKE 'c_t';


-- ----------------------------------------------------------
-- 6) INTERVALOS (BETWEEN e comparações)
-- ----------------------------------------------------------

SELECT "title", "year"
FROM "longlist"
WHERE "year" BETWEEN 2019 AND 2022;

-- É o mesmo que:
SELECT "title", "year"
FROM "longlist"
WHERE "year" >= 2019 AND "year" <= 2022;


-- ----------------------------------------------------------
-- 7) ORDER BY
--    Ordena o resultado. ASC (padrão, crescente) ou DESC.
-- ----------------------------------------------------------

-- Do maior para o menor
SELECT "title", "rating"
FROM "longlist"
ORDER BY "rating" DESC;

-- Ordenar por mais de uma coluna
SELECT "title", "rating", "votes"
FROM "longlist"
ORDER BY "rating" DESC, "votes" DESC
LIMIT 10;


-- ----------------------------------------------------------
-- 8) FUNÇÕES DE AGREGAÇÃO
--    Resumem várias linhas em um único valor.
--      COUNT()  quantas linhas
--      SUM()    soma
--      AVG()    média
--      MAX()    maior valor
--      MIN()    menor valor
--      ROUND()  arredonda
--      DISTINCT remove repetidos
-- ----------------------------------------------------------

-- Quantos livros existem?
SELECT COUNT(*) FROM "longlist";

-- Quantos autores DIFERENTES?
SELECT COUNT(DISTINCT "author") FROM "longlist";

-- Média das notas, arredondada para 2 casas
SELECT ROUND(AVG("rating"), 2) AS "media" FROM "longlist";

-- Maior e menor nota
SELECT MAX("rating"), MIN("rating") FROM "longlist";

-- Total de votos
SELECT SUM("votes") FROM "longlist";

-- AS dá um apelido (nome) para a coluna do resultado
SELECT ROUND(AVG("rating"), 1) AS "nota media" FROM "longlist";


/*
==========================================================
 RESUMO – ORDEM DOS COMANDOS

   SELECT   colunas
   FROM     tabela
   WHERE    condição
   ORDER BY coluna
   LIMIT    quantidade;

==========================================================
 DICAS PARA OS EXERCÍCIOS DA SEMANA 0
 (Cyberchase, 36 Views or Normals, Players)

 - Leia o enunciado e descubra: qual TABELA? quais COLUNAS?
   qual FILTRO? precisa ORDENAR ou CONTAR?
 - Use ".schema" para ver as tabelas e colunas.
 - Comece com SELECT * ... LIMIT 5 para "espiar" os dados.
 - Vá montando a consulta aos poucos: primeiro o SELECT,
   depois o WHERE, depois o ORDER BY.
 - Tipos de pergunta comuns:
     "Liste os nomes de ..."            -> SELECT + WHERE
     "Quantos ... existem?"             -> COUNT
     "Qual o maior/menor ...?"          -> MAX / MIN ou ORDER BY + LIMIT 1
     "Qual a média de ...?"             -> AVG (+ ROUND)
     "Quais começam com ...?"           -> LIKE
     "Quais não têm ...?"               -> IS NULL
==========================================================
*/

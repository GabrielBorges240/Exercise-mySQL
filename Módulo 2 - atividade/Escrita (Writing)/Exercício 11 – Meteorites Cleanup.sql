-- Exercício 11 – Meteorites Cleanup
-- ===================== import.sql =====================
-- Meteorite Cleanup (CS50 SQL, Semana 3)
-- * Escreva uma série de instruções SQL (e SQLite) para importar e limpar os dados do arquivo meteorites.csv
--   em uma tabela chamada "meteorites", dentro de um banco chamado meteorites.db.

-- * COLUNAS DA TABELA "meteorites"
--   id, name, class, mass, discovery, year, lat, long
-- ? A lista de colunas veio vazia no texto que você colou. Esta é a do curso, mas confirme na página da atividade.
-- ! Nem todas as colunas do CSV devem acabar na tabela final.

-- * CRITÉRIOS DE DADOS LIMPOS
--   1. Valores vazios do CSV viram NULL na tabela.
--      As colunas mass, year, lat e long têm valores vazios no CSV.
--   2. Colunas decimais (mass, lat, long) arredondadas para centésimos (70,4777 vira 70,48).
--   3. Meteoritos com nametype "Relict" não entram na tabela meteorites.
--   4. Ordem: por year, do mais antigo ao mais novo; em empate, por name, em ordem alfabética.
--   5. Reatribua os ids a partir dessa ordem: o id começa em 1, no meteorito do ano mais antigo
--      que for o primeiro em ordem alfabética daquele ano.

-- ? Dica de processo: importe o CSV para uma tabela temporária, limpe e só então copie para a tabela final.
-- ? Rode .schema e SELECT * FROM tabela LIMIT 5; antes de começar.
-- TODO: escreva suas instruções abaixo desta linha
-- ===================== schema.sql =====================
-- * Crie o banco SQLite da ATL do zero, só com CREATE TABLE.

-- * Passageiros: primeiro nome, sobrenome e idade (nada mais).
-- * Check-ins: data e hora exatas do check-in e o voo.
-- * Companhias aéreas: nome e o concourse onde opera (A, B, C, D, E, F ou T).
-- * Voos: número do voo (pode ser reutilizado), companhia aérea, aeroporto de partida,
--   aeroporto de destino, data e hora esperadas de partida e de chegada (precisão de minuto).

-- ? O banco deve representar estes dados:
--   Amelia Earhart, 39 anos;
--   Delta, que opera nos concourses A, B, C, D e T;
--   Voo Delta 300: ATL -> BOS, 3/8/2023, saída 18h46, chegada 21h09;
--   Check-in de Amelia Earhart no voo Delta 300, em 3/8/2023 às 15h03.
-- ! Uma companhia pode operar em vários concourses.
-- TODO:
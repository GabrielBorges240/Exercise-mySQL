-- Exercício 16 – your.harvard
-- ===================== indexes.sql =====================
-- your.harvard (CS50 SQL, Semana 5)
-- * Escreva instruções SQL que criem índices para acelerar as consultas típicas do harvard.db.
-- * Quantos índices criar e quais colunas incluir fica a seu critério.
-- ! Equilibre velocidade e espaço em disco: crie apenas os índices de que realmente precisar.
-- ? As consultas SELECT típicas do harvard.db (mostradas no spoiler da página) vieram em branco no texto que você colou.
--   Copie-as da página da atividade antes de começar.

-- * COMO TRABALHAR (perspectiva oposta à de In a Snap: aqui você cria índices para consultas já existentes)
--   1. Rode EXPLAIN QUERY PLAN antes de cada consulta típica para ver o plano atual.
--   2. Procure por SCAN (lê todas as linhas, lento). O objetivo é transformar SCAN em SEARCH.
--   3. Crie um índice, rode o plano de novo e confirme que o SCAN virou SEARCH.
--   4. Repita para todas as consultas até que todas usem índices.

-- * DEPOIS, MINIMIZE OS ÍNDICES
--   Índices ocupam espaço e podem deixar INSERT, UPDATE e DELETE mais lentos. Pergunte-se:
--   - Algum índice tem as mesmas colunas de outro? Mantenha só um.
--   - Algum índice tem colunas que as consultas não usam? Tire essas colunas.
--   - Remover um índice muda o plano de alguma consulta? Se não, remova-o.

-- ? Exemplo de plano da 1ª consulta típica: SCAN na tabela enrollments, então ela é candidata a índice.
-- ? Para testar: .read indexes.sql
-- ? Para refazer um índice: DROP INDEX nome;   e depois VACUUM; para liberar espaço em disco.
-- TODO: escreva seus CREATE INDEX abaixo desta linha
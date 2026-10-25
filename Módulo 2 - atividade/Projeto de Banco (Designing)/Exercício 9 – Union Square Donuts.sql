-- Exercício 9 – Union Square Donuts
-- ===================== schema.sql =====================
-- Union Square Donuts (CS50 SQL, Semana 2)
-- * Crie o banco SQLite da Union Square Donuts do zero, só com CREATE TABLE.
-- * Ele deve atender às expectativas abaixo e representar os dados de exemplo.


-- * INGREDIENTES
--   Guardar o nome (farinha, fermento, óleo, manteiga, vários açúcares...)
--   e o preço pago por unidade do ingrediente (libra, grama etc.).

-- * DONUTS (cardápio, passados e presentes)
--   Guardar: nome, se é sem glúten e o preço por donut.
-- ! Deve ser possível pesquisar os ingredientes de cada donut.

-- * PEDIDOS
--   Guardar:
--   - número do pedido (controle interno)
--   - todos os donuts do pedido
--   - o cliente que fez o pedido (um único cliente por pedido)

-- * CLIENTES
--   Guardar: nome, sobrenome e o histórico dos pedidos que fez.


-- ? DADOS DE EXEMPLO (o banco deve conseguir representar)
--   - Ingrediente: cacau, US$ 5,00 por libra.
--   - Ingrediente: açúcar, US$ 2,00 por libra.
--   - Donut "Belgian Dark Chocolate": não é sem glúten, US$ 4,00.
--       Ingredientes: cacau, farinha, leitelho, açúcar.
--   - Donut "Back-to-School Sprinkles": não é sem glúten, US$ 4,00.
--       Ingredientes: farinha, leitelho, açúcar, granulados.
--   - Pedido 1 de Luis Singh: 3 donuts Belgian Dark Chocolate e 2 donuts Back-to-School Sprinkles.
-- ! Um pedido tem vários donuts, e um donut aparece em vários pedidos (com quantidade).


-- TODO: escreva seus CREATE TABLE abaixo desta linha
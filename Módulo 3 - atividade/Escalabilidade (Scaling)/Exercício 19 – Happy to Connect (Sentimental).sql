-- Exercício 19 – Happy to Connect (Sentimental)
-- ===================== no_descriptions.sql =====================
-- Bed and Breakfast (CS50 SQL, Semana 4)
-- * Em cada arquivo, escreva uma instrução SQL que crie uma view sobre os dados do bnb.db.
-- ! Cada view deve ser independente: não pode depender de outra view criada antes.

-- * Criar a view "no_descriptions".
-- * Deve incluir todas as colunas da tabela listings, EXCETO description.
-- ? Motivo: description tem muitas quebras de linha e polui o terminal em SELECT * FROM "listings" LIMIT 5;
-- TODO: escreva seu CREATE VIEW abaixo desta linha


-- ===================== one_bedrooms.sql =====================
-- * Criar a view "one_bedrooms".
-- * Deve conter todos os anúncios com exatamente um quarto.
-- * Colunas:
--   - id (o id do anúncio, da tabela listings)
--   - property_type (da tabela listings)
--   - host_name (da tabela listings)
--   - accommodates (da tabela listings)
-- TODO: escreva seu CREATE VIEW abaixo desta linha


-- ===================== available.sql =====================
-- * Criar a view "available".
-- * Deve conter todas as datas disponíveis de todos os anúncios.
-- * Colunas:
--   - id (o id do anúncio, da tabela listings)
--   - property_type (da tabela listings)
--   - host_name (da tabela listings)
--   - date (da tabela availabilities: a data da disponibilidade)
-- TODO: escreva seu CREATE VIEW abaixo desta linha


-- ===================== frequently_reviewed.sql =====================
-- * Criar a view "frequently_reviewed".
-- * Deve conter os 100 anúncios mais avaliados, do mais para o menos avaliado.
-- * Colunas:
--   - id (o id do anúncio, da tabela listings)
--   - property_type (da tabela listings)
--   - host_name (da tabela listings)
--   - reviews (número de avaliações que o anúncio recebeu)
-- * Empate no número de avaliações: ordene por property_type (alfabética), depois por host_name (alfabética).
-- TODO: escreva seu CREATE VIEW abaixo desta linha


-- ===================== june_vacancies.sql =====================
-- * Criar a view "june_vacancies".
-- * Deve conter todos os anúncios e o número de dias em junho de 2023 em que ficaram vagos.
-- * Colunas:
--   - id (o id do anúncio, da tabela listings)
--   - property_type (da tabela listings)
--   - host_name (da tabela listings)
--   - days_vacant (número de dias em junho de 2023 em que o anúncio estava marcado como disponível)
-- TODO: escreva seu CREATE VIEW abaixo desta linha
-- Exercício 17 – Don't Panic (Sentimental)
-- ===================== rural.sql =====================
-- Census (CS50 SQL, Semana 4)
-- * Em cada arquivo, escreva uma instrução SQL que crie uma view sobre os dados do census.db.
-- ! Cada view deve ser independente: não pode depender de outra view criada antes.

-- * Criar a view "rural".
-- * Deve conter todos os registros da tabela census de municípios rurais (o nome inclui "rural").
-- * A view deve ter todas as colunas da tabela.
-- TODO: escreva seu CREATE VIEW abaixo desta linha


-- ===================== total.sql =====================
-- * Criar a view "total".
-- * Deve conter a soma de cada coluna numérica da tabela census, em todos os distritos e localidades.
-- * Colunas:
--   - families: soma das famílias de todas as localidades do Nepal
--   - households: soma dos domicílios
--   - population: soma da população
--   - male: soma de pessoas que se identificam como homens
--   - female: soma de pessoas que se identificam como mulheres
-- TODO: escreva seu CREATE VIEW abaixo desta linha


-- ===================== by_district.sql =====================
-- * Criar a view "by_district".
-- * Deve conter as somas de cada coluna numérica da tabela census, agrupadas por distrito.
-- * Colunas:
--   - district: nome do distrito
--   - families: total de famílias no distrito
--   - households: total de domicílios no distrito
--   - population: população total do distrito
--   - male: total de pessoas que se identificam como homens no distrito
--   - female: total de pessoas que se identificam como mulheres no distrito
-- TODO: escreva seu CREATE VIEW abaixo desta linha


-- ===================== most_populated.sql =====================
-- * Criar a view "most_populated".
-- * Deve listar os distritos mais populosos do Nepal, do maior para o menor.
-- * Colunas: district, families, households, population, male, female (totais por distrito).
-- ! Lembre-se: a view deve ser independente, então não use by_district dentro dela.
-- TODO: escreva seu CREATE VIEW abaixo desta linha
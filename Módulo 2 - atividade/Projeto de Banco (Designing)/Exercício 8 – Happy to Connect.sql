-- Exercício 8 – Happy to Connect
-- ===================== schema.sql =====================
-- Happy to Connect (CS50 SQL, Semana 2) - LinkedIn
-- * Crie o banco SQLite do LinkedIn do zero, só com CREATE TABLE.
-- * Ele deve atender à plataforma abaixo e representar os dados de exemplo.


-- * USUÁRIOS
--   primeiro nome, sobrenome, nome de usuário e senha.
-- ? Não precisa fazer hash da senha.

-- * ESCOLAS E UNIVERSIDADES
--   nome, tipo (Escola Primária, Ensino Médio, Faculdade, Universidade etc.),
--   localização e ano de fundação.

-- * EMPRESAS
--   nome, setor (Educação, Tecnologia, Finanças etc.) e localização.

-- * CONEXÕES
--   - Com pessoas: o texto que você colou veio sem o conteúdo desta parte.
--   - Com escolas: o usuário se afilia a uma escola, e a escola deve conseguir encontrar seus ex-alunos.
--       Guardar: data de início, data de término (se aplicável) e tipo de diploma (BA, MA, PhD etc.).
--   - Com empresas: o usuário se afilia a uma empresa, e a empresa deve conseguir encontrar seus funcionários atuais e antigos.
--       Guardar: data de início, data de término (se aplicável) e título que tinha na empresa.
-- ! Data de término é opcional (a pessoa pode ainda estar na escola ou na empresa).


-- ? DADOS DE EXEMPLO (o banco deve conseguir representar)
--   - Usuário: Alan Garber, username "alan", senha "password".
--   - Usuário: Reid Hoffman, username "reid", senha "password".
--   - Escola: Universidade de Harvard, universidade em Cambridge, Massachusetts, fundada em 1636.
--   - Empresa: LinkedIn, empresa de tecnologia em Sunnyvale, Califórnia.
--   - Alan Garber em Harvard: bacharelado (BA), de 1/9/1973 a 1/6/1976.
--   - Reid Hoffman no LinkedIn: CEO e Presidente, de 1/1/2003 a 1/2/2007.


-- TODO: escreva seus CREATE TABLE abaixo desta linha
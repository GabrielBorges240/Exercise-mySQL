-- Exercício 15 – In a Snap
-- ===================== 1.sql =====================
-- In a Snap (CS50 SQL, Semana 5)
-- * Em cada arquivo, escreva uma consulta SQL para a funcionalidade descrita.
-- ! A consulta deve usar o índice indicado. Confirme com EXPLAIN QUERY PLAN antes da sua consulta.

-- * Nomes de usuário dos usuários que fizeram login desde 01-01-2024 (usuários ativos).
-- ? Índice a usar: search_users_by_last_login, definido como
--   CREATE INDEX "search_users_by_last_login" ON "users"("last_login_date");
-- TODO: escreva sua consulta abaixo desta linha


-- ===================== 2.sql =====================
-- * Quando a mensagem com ID 151 expira (para impedir a reabertura de mensagens expiradas).
-- * Pode usar o ID 151 diretamente na consulta.
-- ? Índice a usar: o criado automaticamente na chave primária da tabela messages.
-- TODO: escreva sua consulta abaixo desta linha


-- ===================== 3.sql =====================
-- * IDs dos 3 usuários para quem o usuário "creativewisdom377" mais envia mensagens ("melhores amigos").
-- * Ordem: pelo número de mensagens enviadas a cada um, do maior para o menor.
-- ? Índice a usar: search_messages_by_from_user_id, definido como
--   CREATE INDEX "search_messages_by_from_user_id" ON "messages"("from_user_id");
-- TODO: escreva sua consulta abaixo desta linha


-- ===================== 4.sql =====================
-- * Nome de usuário do usuário mais popular: aquele que recebeu mais mensagens.
-- ? Índice a usar: search_messages_by_to_user_id, definido como
--   CREATE INDEX "search_messages_by_to_user_id" ON "messages"("to_user_id");
-- TODO: escreva sua consulta abaixo desta linha


-- ===================== 5.sql =====================
-- * IDs dos amigos em comum entre os usuários "lovelytrust487" e "exceptionalinspiration482".
-- * Amigo em comum: usuário que está na lista de amigos dos dois.
-- ? Índice a usar: o criado automaticamente na chave primária da tabela friends, chamado sqlite_autoindex_friends_1.
-- TODO: escreva sua consulta abaixo desta linha
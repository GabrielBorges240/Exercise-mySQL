/*
==========================================================
 CS50 SQL – Aula 6: Scaling (Escalando)
==========================================================

 O QUE É?
 O que muda quando o banco cresce e muita gente usa ao mesmo
 tempo. Nesta aula saímos do SQLite e conhecemos o MySQL
 (um servidor de banco de dados), além de segurança e
 técnicas para escalar.

==========================================================
*/


-- ----------------------------------------------------------
-- 1) SQLITE x MYSQL
--    SQLite : banco em um único arquivo, simples e local.
--    MySQL  : servidor separado, aceita muitos usuários ao
--             mesmo tempo, com controle de acesso.
--
--    Entrar no MySQL pelo terminal:
--      mysql -u root -p
-- ----------------------------------------------------------


-- ----------------------------------------------------------
-- 2) COMANDOS BÁSICOS DO MYSQL
-- ----------------------------------------------------------

CREATE DATABASE `escola`;
SHOW DATABASES;
USE `escola`;
SHOW TABLES;
DESCRIBE `alunos`;     -- mostra as colunas da tabela


-- ----------------------------------------------------------
-- 3) TIPOS DE DADOS DO MYSQL (mais variados que no SQLite)
--    Inteiros : TINYINT, SMALLINT, INT, BIGINT
--    Decimais : DECIMAL(10,2), FLOAT, DOUBLE
--    Texto    : CHAR(n), VARCHAR(n), TEXT
--    Data/hora: DATE, TIME, DATETIME, TIMESTAMP
--    Lista    : ENUM('a', 'b', 'c')
--    Binário  : BLOB
-- ----------------------------------------------------------

CREATE TABLE `alunos` (
    `id`        INT UNSIGNED AUTO_INCREMENT,
    `nome`      VARCHAR(50) NOT NULL,
    `nivel`     ENUM('iniciante', 'intermediario', 'avancado'),
    `criado_em` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

-- AUTO_INCREMENT = o MySQL gera o id sozinho (1, 2, 3...)

INSERT INTO `alunos` (`nome`, `nivel`) VALUES ('Gabriel', 'iniciante');


-- ----------------------------------------------------------
-- 4) CONTROLE DE ACESSO (usuários e permissões)
--    Princípio: dar a cada usuário só o que ele precisa.
-- ----------------------------------------------------------

CREATE USER 'leitor'@'localhost' IDENTIFIED BY 'senha_forte';

-- Só pode LER a tabela alunos
GRANT SELECT ON `escola`.`alunos` TO 'leitor'@'localhost';

-- Retirar a permissão
REVOKE SELECT ON `escola`.`alunos` FROM 'leitor'@'localhost';

DROP USER 'leitor'@'localhost';


-- ----------------------------------------------------------
-- 5) SQL INJECTION (ataque)
--    Acontece quando o programa monta a consulta juntando
--    texto digitado pelo usuário.
--
--    Código vulnerável:
--      "SELECT * FROM users WHERE name = '" + entrada + "'"
--
--    Se o usuário digitar:   ' OR '1'='1
--    a consulta vira:
--      SELECT * FROM users WHERE name = '' OR '1'='1'
--    e retorna TODOS os usuários (a condição é sempre verdadeira).
-- ----------------------------------------------------------


-- ----------------------------------------------------------
-- 6) PREPARED STATEMENTS (a defesa)
--    A consulta e os dados são enviados SEPARADOS, então o
--    que o usuário digita nunca vira código SQL.
-- ----------------------------------------------------------

PREPARE `busca`
FROM 'SELECT * FROM `alunos` WHERE `nome` = ?';

SET @nome = 'Gabriel';
EXECUTE `busca` USING @nome;

DEALLOCATE PREPARE `busca`;

-- Em Python/Java/PHP, use sempre os "?" (parâmetros) em vez
-- de concatenar texto.


-- ----------------------------------------------------------
-- 7) COMO ESCALAR UM BANCO (conceitos)
--
--    REPLICAÇÃO: copiar o banco em vários servidores.
--      - Servidor PRIMÁRIO (principal): recebe as escritas.
--      - Servidores RÉPLICAS: recebem cópias e atendem as
--        leituras. Também servem de backup.
--
--    SHARDING: dividir os dados em pedaços (shards) guardados
--      em servidores diferentes (ex.: usuários A-M num servidor
--      e N-Z em outro). Cada servidor cuida de menos dados.
--
--    Também ajudam: índices (Aula 5) e transações.
-- ----------------------------------------------------------


/*
==========================================================
 DICAS PARA OS EXERCÍCIOS DA SEMANA 6
 (Don't Panic Sentimental / From the Deep /
  Happy to Connect Sentimental)

 - Cuidado: em MySQL os nomes usam crases (`), não aspas
   duplas.
 - Leia com atenção o que o enunciado pede: ataque,
   defesa, ou criação de usuários?
 - Em "From the Deep", pense em como o SQL injection
   foi feito e como um prepared statement evitaria.
 - As versões "Sentimental" são mais difíceis e opcionais
   em alguns casos. Confira o enunciado.
==========================================================
*/

/*
==========================================================
 CS50 SQL – Aula 2: Designing (Projetando)
==========================================================

 O QUE É?
 Agora deixamos de só LER e passamos a CRIAR a estrutura do
 banco: as tabelas, as colunas, os tipos e as regras.
 Essa estrutura se chama SCHEMA (esquema).

==========================================================
*/


-- ----------------------------------------------------------
-- 1) CREATE TABLE
-- ----------------------------------------------------------

CREATE TABLE "students" (
    "id"    INTEGER,
    "name"  TEXT NOT NULL,
    "email" TEXT UNIQUE,
    PRIMARY KEY("id")
);


-- ----------------------------------------------------------
-- 2) TIPOS DE DADOS DO SQLITE (storage classes)
--    NULL     = sem valor
--    INTEGER  = números inteiros
--    REAL     = números com casas decimais
--    TEXT     = texto
--    BLOB     = dados binários (imagens, arquivos)
--
--    "Type affinity": o SQLite converte o valor para o tipo
--    mais parecido com o que você declarou.
-- ----------------------------------------------------------


-- ----------------------------------------------------------
-- 3) RESTRIÇÕES (CONSTRAINTS)
--    PRIMARY KEY : identifica a linha
--    FOREIGN KEY : liga a outra tabela
--    NOT NULL    : não aceita vazio
--    UNIQUE      : não aceita repetido
--    DEFAULT     : valor padrão se não informar
--    CHECK       : exige que uma condição seja verdadeira
-- ----------------------------------------------------------

CREATE TABLE "courses" (
    "id"         INTEGER,
    "title"      TEXT NOT NULL,
    "credits"    INTEGER NOT NULL DEFAULT 4 CHECK("credits" > 0),
    PRIMARY KEY("id")
);

-- Tabela de junção (muitos-para-muitos) com chaves estrangeiras
CREATE TABLE "enrollments" (
    "student_id" INTEGER,
    "course_id"  INTEGER,
    PRIMARY KEY("student_id", "course_id"),
    FOREIGN KEY("student_id") REFERENCES "students"("id"),
    FOREIGN KEY("course_id")  REFERENCES "courses"("id")
);


-- ----------------------------------------------------------
-- 4) ON DELETE (o que fazer quando a linha "pai" é apagada)
--      ON DELETE RESTRICT    : impede apagar
--      ON DELETE NO ACTION   : impede apagar (padrão)
--      ON DELETE SET NULL    : coloca NULL na chave filha
--      ON DELETE SET DEFAULT : coloca o valor padrão
--      ON DELETE CASCADE     : apaga também as linhas filhas
-- ----------------------------------------------------------

CREATE TABLE "grades" (
    "id"         INTEGER,
    "student_id" INTEGER,
    "score"      REAL,
    PRIMARY KEY("id"),
    FOREIGN KEY("student_id") REFERENCES "students"("id")
        ON DELETE CASCADE
);


-- ----------------------------------------------------------
-- 5) ALTER TABLE e DROP TABLE
-- ----------------------------------------------------------

-- Adicionar coluna
ALTER TABLE "students" ADD COLUMN "phone" TEXT;

-- Renomear coluna
ALTER TABLE "students" RENAME COLUMN "phone" TO "telefone";

-- Renomear tabela
ALTER TABLE "students" RENAME TO "alunos";

-- Remover coluna
ALTER TABLE "alunos" DROP COLUMN "telefone";

-- Apagar a tabela inteira (cuidado: não tem volta!)
DROP TABLE "grades";


-- ----------------------------------------------------------
-- 6) NORMALIZAÇÃO
--    É organizar as tabelas para NÃO repetir dados.
--    Exemplo: em vez de escrever o nome da editora em todo
--    livro, crie a tabela "publishers" e guarde só o id.
--    Vantagens: menos espaço, menos erros, fácil de atualizar.
-- ----------------------------------------------------------


-- ----------------------------------------------------------
-- 7) COMANDOS ÚTEIS NO TERMINAL DO SQLITE
-- ----------------------------------------------------------
-- .tables        lista as tabelas
-- .schema        mostra os CREATE TABLE
-- .schema alunos mostra o schema de uma tabela


/*
==========================================================
 DICAS PARA OS EXERCÍCIOS DA SEMANA 2
 (ATL / Happy to Connect / Union Square Donuts)

 - Desenhe o diagrama ER ANTES de escrever o SQL.
 - Para cada entidade, uma tabela com PRIMARY KEY.
 - Relação muitos-para-muitos = tabela de junção.
 - Use NOT NULL, UNIQUE e CHECK para proteger os dados.
 - Escolha o tipo certo: dinheiro/nota -> REAL ou INTEGER
   (centavos), datas e nomes -> TEXT.
==========================================================
*/

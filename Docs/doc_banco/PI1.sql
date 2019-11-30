﻿-- ----------------<< Chamada Eletronica >>--------------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 12/11/2019
-- Autor(es) ..............: Iago Theóphilo de Lima
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: biochamada
--
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
-- -------------------------------------------------------------
CREATE DATABASE biochamada;
use biochamada;

CREATE TABLE PROFESSOR (
    nome varchar(50),
    email varchar(50) PRIMARY KEY,
    tokenP varchar(50) NOT NULL,
    foto LONGBLOB,
    matricula int NOT NULL,
    senha varchar(50) NOT NULL,
 CONSTRAINT PROFESSOR_UN UNIQUE (tokenP,matricula)
);

CREATE TABLE ALUNO (
    matricula int PRIMARY KEY,
    nome varchar(50),
    tokenA varchar(50),
    foto LONGBLOB
);

CREATE TABLE TURMAS (
    turmaNome varchar(50),
    dia varchar(50),
    horario varchar(50),
    codigo int,
    PRIMARY KEY (turmaNome, codigo)
);

CREATE TABLE DISCIPLINA (
    nomeDisciplina varchar(50),
    codigo int PRIMARY KEY
);

CREATE TABLE SALA (
    local varchar(50) PRIMARY KEY,
    capacidade int
);

CREATE TABLE CHAMADA (
    idChamada int AUTO_INCREMENT ,
    dhInicio varchar(50),
    dhFim varchar(50),
    email varchar(50),
    turmaNome varchar(50),
    codigo int,
    CONSTRAINT CHAMADA_PK PRIMARY KEY(idChamada)
)AUTO_INCREMENT = 1;

CREATE TABLE esta (
    turmaNome varchar(50),
    local varchar(50),
    codigo int
);

CREATE TABLE ministra (
    email varchar(50),
    turmaNome varchar(50),
    codigo int
);

CREATE TABLE assina (
    matricula int,
    idChamada int,
    presenca enum('P','F'),
    dh varchar(50)
);

CREATE TABLE matriculado (
    matricula int,
    turmaNome varchar(50),
    codigo int
);
 
ALTER TABLE TURMAS ADD CONSTRAINT FK_TURMAS_2
    FOREIGN KEY (codigo)
    REFERENCES DISCIPLINA (codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE CHAMADA ADD CONSTRAINT FK_CHAMADA_2
    FOREIGN KEY (email)
    REFERENCES PROFESSOR (email)
    ON DELETE RESTRICT;
 
ALTER TABLE CHAMADA ADD CONSTRAINT FK_CHAMADA_3
    FOREIGN KEY (turmaNome, codigo)
    REFERENCES TURMAS (turmaNome, codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE esta ADD CONSTRAINT FK_esta_1
    FOREIGN KEY (turmaNome, codigo)
    REFERENCES TURMAS (turmaNome, codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE esta ADD CONSTRAINT FK_esta_2
    FOREIGN KEY (local)
    REFERENCES SALA (local)
    ON DELETE RESTRICT;
 
ALTER TABLE ministra ADD CONSTRAINT FK_ministra_1
    FOREIGN KEY (email)
    REFERENCES PROFESSOR (email)
    ON DELETE RESTRICT;
 
ALTER TABLE ministra ADD CONSTRAINT FK_ministra_2
    FOREIGN KEY (turmaNome, codigo)
    REFERENCES TURMAS (turmaNome, codigo)
    ON DELETE SET NULL;
 
ALTER TABLE assina ADD CONSTRAINT FK_assina_1
    FOREIGN KEY (matricula)
    REFERENCES ALUNO (matricula)
    ON DELETE RESTRICT;
 
ALTER TABLE assina ADD CONSTRAINT FK_assina_2
    FOREIGN KEY (idChamada)
    REFERENCES CHAMADA (idChamada)
    ON DELETE RESTRICT;
 
ALTER TABLE matriculado ADD CONSTRAINT FK_matriculado_1
    FOREIGN KEY (matricula)
    REFERENCES ALUNO (matricula)
    ON DELETE RESTRICT;
 
ALTER TABLE matriculado ADD CONSTRAINT FK_matriculado_2
    FOREIGN KEY (turmaNome, codigo)
    REFERENCES TURMAS (turmaNome, codigo)
    ON DELETE RESTRICT;
INSERT INTO `SALA` (`local`, `capacidade`) VALUES ('S1', '100'), ('S2', '100'), ('S3', '50'), ('S4', '60'), ('S5', '50');
INSERT INTO `DISCIPLINA` (`nomeDisciplina`, `codigo`) VALUES ('Projeto Integrador 1', '1'), ('MDS', '2'), ('Banco de Dados', '3'), ('Calculo1', '4'), ('Calculo2', '5');
INSERT INTO `TURMAS` (`turmaNome`, `dia`, `horario`, `codigo`) VALUES ('A', 'segunda-quarta', '10h-12H', '2'), ('A', 'segunda-terça', '10h-12h', '1');
INSERT INTO `esta` (`turmaNome`, `local`, `codigo`) VALUES ('A', 'S1', '1'), ('A', 'S2', '1');
INSERT INTO `PROFESSOR` (`nome`, `email`, `tokenP`, `foto`, `matricula`, `senha`) VALUES ('Joenio da Silva', 'joenio@gmail.com', '10', '', '2019101010', '123'), ('Maria da Silva Coelho', 'mariacoelho@gmail.com', '20', '', '2019101011', '123'), ('Edivan Pereira', 'ed.pereira@gmail.com', '30', '', '2019101012', '123'), ('Vanilsa da Rocha Pinto Machado', 'vani.machada@gmail.com', '40', '', '2019101013', '123'), ('Mari Julia somente', 'maju@gmail.com', '50', '', '2019101014', '123');


CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
 
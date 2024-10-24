CREATE DATABASE EXERCICIO1;
USE EXERCICIO1;

CREATE TABLE IF NOT EXISTS PARTICIPANTES(
NUM_INSCRICAO INT,
CPF VARCHAR(14),
PRIMARY KEY(NUM_INSCRICAO,CPF),
NOME VARCHAR(100) NOT NULL,
DATA_NASC DATE NOT NULL,
EMPRESA VARCHAR(100));

CREATE TABLE IF NOT EXISTS LOCAIS(
ID_LOCAL INT PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
LOG_LOCAL VARCHAR(100) NOT NULL,
NUMLOG_LOCAL INT,
BAIRRO_LOCAL VARCHAR(100) NOT NULL,
CIDADE VARCHAR(100) NOT NULL,
CEP VARCHAR(100) NOT NULL,
CAPACIDADE INT NOT NULL);

CREATE TABLE IF NOT EXISTS EVENTOS(
ID_EVENTO INT PRIMARY KEY,
NOME_EVENTO VARCHAR(100) NOT NULL,
DATA_EVENTO DATE NOT NULL,
ENTIDADE_EVENTO VARCHAR(100) NOT NULL,
LOCAL_EVENTO INT,
CONSTRAINT FK_LOCAL FOREIGN KEY(LOCAL_EVENTO) REFERENCES LOCAIS(ID_LOCAL));

CREATE TABLE IF NOT EXISTS ATIVIDADES(
ID_ATIVIDADE INT PRIMARY KEY,
NOME_ATV VARCHAR(100) NOT NULL,
DATA_ATV DATE NOT NULL,
HORA_ATV TIME NOT NULL,
EVENTO_ATV INT NOT NULL,
CONSTRAINT FK_EVENTO FOREIGN KEY(EVENTO_ATV) REFERENCES EVENTOS(ID_EVENTO));

CREATE TABLE IF NOT EXISTS PARTICIPANTES_ATIVIDADES(
INSCRICAO INT,
CPF VARCHAR(14),
ATIVIDADE INT,
PRIMARY KEY(INSCRICAO, CPF, ATIVIDADE),
CONSTRAINT FK_PART_ATV FOREIGN KEY(INSCRICAO,CPF) REFERENCES PARTICIPANTES(NUM_INSCRICAO,CPF),
CONSTRAINT FK_ATV_PART FOREIGN KEY(ATIVIDADE) REFERENCES ATIVIDADES(ID_ATIVIDADE));

CREATE TABLE IF NOT EXISTS PARTICIPANTES_EVENTOS(
INSCRICAO INT,
CPF VARCHAR(14),
EVENTO INT,
PRIMARY KEY(INSCRICAO,CPF,EVENTO),
CONSTRAINT FK_PART_EVT FOREIGN KEY(INSCRICAO,CPF) REFERENCES PARTICIPANTES(NUM_INSCRICAO,CPF),
CONSTRAINT FK_EVT_PART FOREIGN KEY(EVENTO) REFERENCES EVENTOS(ID_EVENTO));

#EXEMPLO DE ALTER
ALTER TABLE PARTICIPANTES
ADD EMAIL VARCHAR(30);

#EXEMPLO DE ALTER
ALTER TABLE PARTICIPANTES
MODIFY COLUMN EMAIL VARCHAR(30) NOT NULL;

SHOW FIELDS FROM PARTICIPANTES;

DROP DATABASE EXERCICIO1; #EXEMPLO DE DROP

# Criando_Schema_Tabelas_Colunas
Neste projeto eu utilizei SQL no Azure SQL server, um banco de dados em nuvem. Dentro de um Banco de Dados feito por mim eu criei um Schema chamado Curso e atribui a ele tabelas, colunas e registros.

Na descrição abaixo irei deixar todos os comandos que utilizei

# Criação de um Schema

Chave primaria - é o ID que identifica uma coluna

Chave Secundaria - é o ID que identifica outra coluna1 dentro de outra coluna2

### Criar tabelas:

CREATE SCHEMA Curso - Criando um schema em um banco de dados 

CREATE TABLE Curso.Turma - Criou uma tabela dentro do schema

### Como vai funcionar a criação:

--COLUNA - TIPO DE DADOS - se pode ou não ser null

**Dentro do CREATE TABLE Curso.Turma nós colocamos:** 

A primeira coluna e assim por diante.

**TurmaID (INT IDENTITY (1,1) PRIMARY KEY NOT NULL) :**

 ****Criando a primeira coluna com chave primaria e automatizando ela com IDENTITY para incrementar sempre 1 numero + o outro, INT é para identificar o tipo de dado e NOT NULL é uma regra pra não deixar cadastrar dados vazios

**Segunda Coluna:**

Nome **VARCHAR**(100) **NOT** **NULL**

VARCHAR limita a quantidade de caracteres dentro da coluna nome 

**Usado como regra em uma tabela para dizer qual é a chave secundaria:**

COINSTRAINT FK_Aula_Turma **FOREIGN** **KEY** (TurmaID)

**REFERENCES** Curso.Turma (TurmaID)

**Usado para fazer o efeito cascata entao voce so pode excluir algum dado em uma chave secundaria se apagar primeiro na primaria:**

ON DELETE

ON UPDATE

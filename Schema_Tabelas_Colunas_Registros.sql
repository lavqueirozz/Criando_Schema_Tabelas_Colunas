'Criando um schema'	

--COLUNA - TIPO DE DADOS - se pode ou nao ser nulo

CREATE SCHEMA Curso;

CREATE TABLE Curso.Turma(
	TurmaID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Curso.Aula(
	AulaID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	TurmaID INT NOT NULL,      
	Data DATETIME NOT NULL,
	Titulo VARCHAR(100) NOT NULL,
	Comentario VARCHAR(1000) NULL,
	CONSTRAINT FK_Aula_Turma FOREIGN KEY(TurmaID)
		REFERENCES Curso.Turma(TurmaID) 
);


CREATE TABLE Curso.Aluno(
	AlunoID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,	
	TurmaID INT NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	EMAIL VARCHAR(255) UNIQUE NOT NULL,
	DtNascimento DATE NOT NULL,
	CONSTRAINT FK_Aluno_Turma FOREIGN KEY(TurmaID)
		REFERENCES Curso.Turma(TurmaID) 
);

	-- Popular as tabelas (Inserir Dados)

		--Dados Turma	
INSERT INTO Curso.Turma(Nome)
	VALUES ('Turma SQL Básico'), ('Turma SQL Avançado');

SELECT *
FROM Curso.Turma


		--Dados Aula 
INSERT INTO Curso.Aula(TurmaID,Data,Titulo, Comentario)
	VALUES (1, '2025-01-29', 'Introdução ao SQL', 'Primeira aula da turma 1.'),
		   (1, '2025-01-30', 'Clausulas SQL', 'Filtros com WHERE e Ordenação com ORDER BY.'),
		   (2, '2025-01-30', 'Funções de agregação SQL', 'Uso de SUM, MAX, AVG, ETC.')


SELECT *
FROM Curso.Aula

		--Dados Aluno

INSERT INTO Curso.Aluno(TurmaID, Nome, EMAIL, DtNascimento)
	VALUES (1, 'Janete Almeida Campos', 'jante@hotmail.com','1995-01-02'),
		   (1, 'Marcos Palmeira', 'marcos@Outlook.com', '1988-07-11'),
		   (2, 'Lucas Neto', 'lcneto@gmail.com', '2000-09-11')
		  
SELECT * FROM Curso.Aluno a 

---------------------------------------------------------------------
'Case 1 - Realizar uma consulta para ver quantas aulas cada turma teve'

SELECT 
	t.Nome,
	a.[Data],
	a.Titulo,
	a.comentario
FROM Curso.Turma t  
	JOIN Curso.Aula a
		ON t.TurmaID = a.TurmaID 
WHERE Nome = 'Turma SQL Básico'

--------------------------------------------------------------------------
'Case 2 - Contar quantas aulas por turma'

SELECT 
	a.TurmaID,
	COUNT(AulaID),
	Nome,
	Titulo
FROM Curso.Aula a 
	JOIN Curso.Turma t 
		ON t.TurmaID = a.TurmaID 
GROUP BY a.TurmaID,Titulo
ORDER BY t.TurmaID 
--------------------------------------------------------------------------
	--Atualizando dados em uma tabela
UPDATE Curso.Aluno 
	SET Email = 'marcosPalme@Outlook.com'
WHERE Email = 'marcos@Outlook.com'

SELECT * FROM Curso.Aluno

---------------------------------------------------------------------------

	--Deletando dados de aluno
	
DELETE FROM Curso.Aluno 
WHERE AlunoID = 13

SELECT * FROM Curso.Aluno a 

DELETE FROM Curso.Turma 
WHERE TurmaID = 5

SELECT * FROM Curso.Turma t 

-----------------------------------------------------------------------------------

	--Apagando Tabelas

DROP TABLE Curso

DROP TABLE Curso.Aluno 

DROP TABLE Curso.Aula 

DROP TABLE Curso.Turma

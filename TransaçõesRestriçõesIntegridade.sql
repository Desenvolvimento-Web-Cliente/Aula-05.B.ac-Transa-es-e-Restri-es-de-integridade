USE avaliacaocontinua;
--Questão 1: criação schema avaliacaocontinua
CREATE SCHEMA avaliacaocontinua;

--Questão 2: criação da tabela company e sua transferência para avaliacaocontinua
CREATE TABLE company(
	company_name varchar(20) NOT NULL PRIMARY KEY,
	city varchar(20));
ALTER SCHEMA avaliacaocontinua TRANSFER dbo.company;

--Questão 3: criação da tabela employee e sua transferência para avaliacaocontinua
CREATE TABLE employee(
	person_name varchar(20) NOT NULL PRIMARY KEY,
	street varchar(20),
	city varchar(20));
ALTER SCHEMA avaliacaocontinua TRANSFER dbo.employee;

--Questão 4: criação da tabela manages e sua transferência para avaliacaocontinua
CREATE TABLE manages(
	person_name varchar(20) NOT NULL PRIMARY KEY,
	manager_name varchar(20));
ALTER SCHEMA avaliacaocontinua TRANSFER dbo.manages;

--Questão 5: criação da tabela works e sua transferência para avaliacaocontinua
CREATE TABLE works(
	person_name varchar(20) NOT NULL PRIMARY KEY,
	company_name varchar(20) NOT NULL,
	salary int);
ALTER SCHEMA avaliacaocontinua TRANSFER dbo.works;

--Questão 6: integridade referencial entre a relação works e a relação employee
ALTER TABLE  avaliacaocontinua.works ADD CONSTRAINT fk_personName FOREIGN KEY (person_name) REFERENCES avaliacaocontinua.employee(person_name);

--Questão 7: integridade referencial entre a relação works e a relação company
ALTER TABLE avaliacaocontinua.works ADD company varchar(20) NOT NULL;
ALTER TABLE avaliacaocontinua.works ADD CONSTRAINT fk_companyName FOREIGN KEY (company) REFERENCES avaliacaocontinua.company(company_name);

--Questão 8: integridade referencial entre a relação manages e a relação employee
ALTER TABLE avaliacaocontinua.manages ADD CONSTRAINT fk_managerName FOREIGN KEY (person_name) REFERENCES avaliacaocontinua.employee(person_name);
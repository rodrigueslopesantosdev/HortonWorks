USE POC_DB;

DROP TABLE IF EXISTS POC_DB.CLIENTE_PF;
CREATE TABLE POC_DB.CLIENTE_PF 
(
	CD_CLIENTE BIGINT, 
	NR_CPF VARCHAR (12), 
	NM_CLIENTE VARCHAR (100), 
	NR_IDADE INT, 
	DT_NASCIMENTO DATE,
	DS_ETNIA VARCHAR (9),
	DS_RELIGIAO VARCHAR (20), 
	DS_ESTADO_CIVIL VARCHAR (10),
	DS_NACIONALIDADE VARCHAR (100),
	DS_NATURALIDADE VARCHAR (100),
	DS_LOGRADOURO VARCHAR (100),
	DS_CIDADE VARCHAR (100),
	DS_UF CHAR (100),
	NR_CEP VARCHAR (9)
)
PARTITIONED BY (DS_SEXO CHAR(1))
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS ORC;

ALTER TABLE POC_DB.CLIENTE_PF ADD CONSTRAINT PK_CLIENTE_PF PRIMARY KEY (CD_CLIENTE) DISABLE NOVALIDATE;





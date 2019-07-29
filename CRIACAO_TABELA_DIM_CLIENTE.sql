

DROP TABLE IF EXISTS DW_REG.DIM_CLIENTE;

CREATE TABLE DW_REG.DIM_CLIENTE 
(
	CD_CLIENTE BIGINT NOT NULL, 
	NR_CPF VARCHAR (12), 
	NM_CLIENTE VARCHAR (100), 
	DS_SEXO CHAR(1), 
	DS_ESTADO_CIVIL VARCHAR (10),
	NR_IDADE INT,
	CD_DT_NASCIMENTO INT ,
	DS_LOGRADOURO VARCHAR (100),
	NM_CEP VARCHAR (9),
	CD_ETNIA INT ,
	CD_RELIGIAO INT ,
	CD_NACIONALIDADE INT ,
	CD_NATURALIDADE INT 
)	
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS ORC;

DROP TABLE IF EXISTS POC_DB.FATURA_PF;
CREATE TABLE POC_DB.FATURA_PF
(
	CD_FATURA BIGINT, 
	CD_CLIENTE BIGINT,
	CD_UND_CONSUMIDORA VARCHAR (14),
	DT_VENCIMENTO DATE,
	DT_PAGAMENTO DATE,
	DT_LEITURA DATE,
	VR_FATURA DECIMAL (9,2),
	QT_CONSUMO_KWh DECIMAL (9,2)	
)
PARTITIONED BY (MES_VENCIMENTO INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS ORC;

ALTER TABLE POC_DB.FATURA_PF ADD CONSTRAINT PK_FATURA_PF PRIMARY KEY (CD_FATURA) DISABLE NOVALIDATE;
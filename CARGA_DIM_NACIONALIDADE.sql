
TRUNCATE TABLE DW_REG.DIM_NACIONALIDADE;

INSERT INTO DW_REG.DIM_NACIONALIDADE 
SELECT
	row_number()over() AS CD_NACIONALIDADE,
	NAC.DS_NACIONALIDADE
FROM
(
	SELECT
		DS_NACIONALIDADE
	FROM
		POC_DB.CLIENTE_FATURA_PF
	GROUP BY 
		DS_NACIONALIDADE
)NAC;

TRUNCATE TABLE DW_REG.DIM_NATURALIDADE;

INSERT INTO DW_REG.DIM_NATURALIDADE 
SELECT
	row_number()over() AS CD_NATURALIDADE,
	NAT.DS_NATURALIDADE
FROM
(
	SELECT
		DS_NATURALIDADE
	FROM
		POC_DB.CLIENTE_FATURA_PF
	GROUP BY 
		DS_NATURALIDADE
)NAT;
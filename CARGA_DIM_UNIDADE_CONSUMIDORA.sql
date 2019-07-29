TRUNCATE TABLE DW_REG.DIM_UNIDADE_CONSUMIDORA;

INSERT INTO DW_REG.DIM_UNIDADE_CONSUMIDORA 
SELECT
	row_number()over() AS COD_UND_CONSUMIDORA,
	UND.DSC_UND_CONSUMIDORA	
FROM
(
	SELECT
		CD_UND_CONSUMIDORA AS DSC_UND_CONSUMIDORA		
	FROM
		POC_DB.CLIENTE_FATURA_PF
	GROUP BY 
		CD_UND_CONSUMIDORA
)UND;
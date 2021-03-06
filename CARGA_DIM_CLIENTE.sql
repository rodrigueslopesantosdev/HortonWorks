

TRUNCATE TABLE DW_REG.DIM_CLIENTE;

INSERT INTO DW_REG.DIM_CLIENTE
SELECT 
	CLI.CD_CLIENTE,
	CLI.NR_CPF,
	CLI.NM_CLIENTE,
	CLI.DS_SEXO,
	CLI.DS_ESTADO_CIVIL,
	CLI.NR_IDADE,
	COALESCE(PDT.CD_PERIODO, -1) AS CD_DT_NASCIMENTO,
	CLI.DS_LOGRADOURO,
	CLI.NR_CEP,
	COALESCE(ETN.CD_ETNIA, -1) AS CD_ETNIA,
	COALESCE(REL.CD_RELIGIAO, -1) AS CD_RELIGIAO,
	COALESCE(NAC.CD_NACIONALIDADE, -1) AS CD_NACIONALIDADE,
	COALESCE(NAT.CD_NATURALIDADE, -1) AS CD_NATURALIDADE
FROM
	POC_DB.CLIENTE_PF CLI
	LEFT JOIN DW_REG.DIM_PERIODO PDT
		ON CLI.DT_NASCIMENTO = PDT.DT_PERIODO
	
	LEFT JOIN DW_REG.DIM_ETNIA ETN
		ON CLI.DS_ETNIA = ETN.DS_ETNIA
	
	LEFT JOIN DW_REG.DIM_RELIGIAO REL
		ON CLI.DS_RELIGIAO = REL.DS_RELIGIAO
		
	LEFT JOIN DW_REG.DIM_NACIONALIDADE NAC
		ON CLI.DS_NACIONALIDADE = NAC.DS_NACIONALIDADE
		
	LEFT JOIN DW_REG.DIM_NATURALIDADE NAT
		ON CLI.DS_NATURALIDADE = NAT.DS_NATURALIDADE

GROUP BY
	CLI.CD_CLIENTE,
	CLI.NR_CPF,
	CLI.NM_CLIENTE,
	CLI.DS_SEXO,
	CLI.DS_ESTADO_CIVIL,
	CLI.NR_IDADE,
	COALESCE(PDT.CD_PERIODO, -1),
	CLI.DS_LOGRADOURO,
	CLI.NR_CEP,
	COALESCE(ETN.CD_ETNIA, -1),
	COALESCE(REL.CD_RELIGIAO, -1),
	COALESCE(NAC.CD_NACIONALIDADE, -1),
	COALESCE(NAT.CD_NATURALIDADE, -1)
;
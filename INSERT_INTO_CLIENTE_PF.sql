
TRUNCATE TABLE POC_DB.CLIENTE_PF;

INSERT INTO POC_DB.CLIENTE_PF
SELECT
	CLI.CD_CLIENTE,
	CLI.NR_CPF,
	CLI.NM_CLIENTE,
	FLOOR(DATEDIFF(CURRENT_DATE, CLI.DT_NASCIMENTO)/365) NR_IDADE,
	CLI.DT_NASCIMENTO,
	CLI.DS_ETNIA,
	CLI.DS_RELIGIAO,
	CLI.DS_ESTADO_CIVIL,
	CLI.DS_NACIONALIDADE,
	CLI.DS_NATURALIDADE,
	CLI.DS_LOGRADOURO,
	CLI.DS_CIDADE,
	CLI.DS_UF,
	CLI.NR_CEP,
	CLI.DS_SEXO
FROM
(
	SELECT 
		
		CD_CLIENTE,
		NR_CPF,
		NM_CLIENTE,
		TO_DATE(SUBSTR(DT_NASCIMENTO,7,4) || '-' || SUBSTR(DT_NASCIMENTO, 4,2) || '-' || SUBSTR(DT_NASCIMENTO, 1, 2)) DT_NASCIMENTO,
		DS_ETNIA,
		DS_RELIGIAO,
		DS_SEXO,
		DS_ESTADO_CIVIL,
		DS_NACIONALIDADE,
		DS_NATURALIDADE,
		DS_LOGRADOURO,
		DS_CIDADE,
		DS_UF,
		NR_CEP

	FROM POC_DB.CLIENTE_PF_CSV
	
)CLI;
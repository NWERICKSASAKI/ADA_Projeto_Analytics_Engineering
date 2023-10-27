{{
    config(
        on_schema_changes="sync_all_columns",
        materialized='table'
    )
}}
-------------------------------------- Média de nota e média de preço por bairro
SELECT
    neighbourhood,
    CAST(ROUND(CAST(AVG(nota) AS DECIMAL(3,2)),2) AS FLOAT) AS avg_nota,
    CAST(ROUND(CAST(AVG(price) AS DECIMAL(10,2)),2) AS FLOAT) AS avg_price,
    CAST(AVG(qtd_quartos) AS INT)AS avg_qtd_quartos,
    CAST(AVG(qtd_camas) AS INT)AS avg_qtd_camas
FROM {{ ref('listings_silver') }}
GROUP BY neighbourhood
ORDER BY avg_nota DESC
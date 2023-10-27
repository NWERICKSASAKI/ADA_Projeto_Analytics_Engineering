{{
    config(
        on_schema_changes="sync_all_columns",
        materialized='table'
    )
}}

------------------------------------------ Média de preço por tipo de casa
SELECT
    room_type,
    CAST(ROUND(CAST(AVG(price) AS DECIMAL(10,2)),2) AS FLOAT) AS avg_price
FROM {{ ref('listings_silver') }}
GROUP BY room_type
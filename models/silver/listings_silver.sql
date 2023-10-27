{{
    config(
        unique_key='id',
        on_schema_changes="sync_all_columns",
        materialized='table'
    )
}}

SELECT
    {{ dbt_utils.generate_surrogate_key(['id', 'host_id']) }} AS table_id,
    tb.id AS house_id,
    tb.host_id AS host_id,
    tb.host_name AS host_name,
    tb.neighbourhood AS neighbourhood,
    tb.room_type AS room_type,
    tb.price AS price,
    tb.minimum_nights AS minimum_nights,
    tb.number_of_reviews AS number_of_reviews,
    tb.reviews_per_month AS reviews_per_month,
    tb.availability_365 AS availability_365,
    tb.number_of_reviews_ltm AS number_of_reviews_ltm,
    REPLACE(tb.nome, ' in Antwerp', '') AS tipo,
    tb.nota AS nota,
    tb.qtd_quartos,
    tb.qtd_camas,
    tb.banheiro AS banheiro
FROM public.listings_bronze as tb
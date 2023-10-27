{{
    config(
        unique_key='id',
        on_schema_changes="sync_all_columns",
        materialized='table'
    )
}}

SELECT
    {{ dbt_utils.generate_surrogate_key(['listing_id', 'date']) }} AS table_id,
    listing_id AS house_id,
    date,
    Case when available = 't' then 1 Else 0 end as available,
    price,
    adjusted_price,
    minimum_nights,	
    maximum_nights
FROM public.calendar_bronze
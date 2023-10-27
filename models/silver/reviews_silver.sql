{{
    config(
        unique_key='id',
        on_schema_changes="sync_all_columns",
        materialized='table'
    )
}}

SELECT
    {{ dbt_utils.generate_surrogate_key(['listing_id', 'id','date', 'reviewer_id']) }} AS table_id,
    listing_id AS house_id,
    id AS review_id,
    date,
    reviewer_id,
    reviewer_name,
    comments
FROM public.reviews_bronze
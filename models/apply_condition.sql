-- models/apply_condition.sql

WITH source_data AS (
    SELECT *
    FROM {{ source('sample20_fivetran_metadata', 'jampack_sample_data') }}
)

SELECT
    *,
    CASE
        WHEN {{ var('ticket_condition') }} THEN 1
        ELSE 0
    END AS ticket_condition_flag
FROM source_data
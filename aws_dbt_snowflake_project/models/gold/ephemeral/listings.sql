{{ config(
    materialized='ephemeral'
) }}

with listings as (
    select LISTING_ID,PROPERTY_NAME,ROOM_TYPE,COUNTRY,PRICE_PER_NIGHT_TAG,LISTING_CREATED_AT
     from {{ref("obt")}}
)
SELECT * FROM listings
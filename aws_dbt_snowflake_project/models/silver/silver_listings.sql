{{ config (materialized = 'incremental',
          unique_key = 'LISTING_ID')}}

SELECT LISTING_ID,
       HOST_ID, {{ trim('PROPERTY_TYPE', 0) }} AS PROPERTY_NAME,
       ROOM_TYPE,CITY,COUNTRY,ACCOMMODATES,
       BEDROOMS,BATHROOMS,PRICE_PER_NIGHT,
       {{tag('CAST(PRICE_PER_NIGHT AS INT)')}} AS PRICE_PER_NIGHT_TAG,
       CREATED_AT
FROM 
  {{ref('bronze_listings')}}


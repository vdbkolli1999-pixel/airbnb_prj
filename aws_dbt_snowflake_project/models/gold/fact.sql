{% set congigs= [
    {
        "table": "AIRBNB.GOLD.OBT",
        "columns": "Gold_OBT.Booking_ID,GOLD_OBT.LISTING_ID,GOLD_OBT.TOTAL_BOOKING_AMOUNT,GOLD_OBT.CLEANING_FEE,GOLD_OBT.SERVICE_FEE,GOLD_OBT.HOST_ID,GOLD_obt.ACCOMMODATES, GOLD_obt.BEDROOMS, GOLD_obt.BATHROOMS, GOLD_obt.PRICE_PER_NIGHT, GOLD_obt.RESPONSE_RATE",
        "alias": "GOLD_OBT"
    },
    {
        "table": "AIRBNB.GOLD.DIM_LISTINGS",
        "columns": "",
        "alias": "DIM_listings",
        "join_condition": "GOLD_OBT.LISTING_ID = DIM_listings.LISTING_ID"
    },
     {
        "table": "AIRBNB.GOLD.DIM_HOSTS",
        "columns": " ",
        "alias": "DIM_hosts",
        "join_condition": "GOLD_OBT.HOST_ID = DIM_hosts.HOST_ID"
    }
]

%}

select 
   {{congigs[0].columns}} 
from 
 {% for config in congigs %}
   {% if loop.first %}
      {{config.table}} AS {{config.alias}}
   {%else%}
       LEFT JOIN {{config.table}} AS {{config.alias}} ON {{config.join_condition}}
     {% endif %}
  {% endfor %}

    
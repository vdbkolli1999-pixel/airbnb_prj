{% set congigs= [
    {
        "table": "AIRBNB.SILVER.SILVER_BOOKINGS",
        "columns": "silver_bookings.* ",
        "alias": "silver_bookings"
    },
    {
        "table": "AIRBNB.SILVER.SILVER_LISTINGS",
        "columns": " silver_listings.HOST_ID, silver_listings.PROPERTY_NAME, silver_listings.ROOM_TYPE,silver_listings.COUNTRY,silver_listings.ACCOMMODATES,silver_listings.BEDROOMS,silver_listings.BATHROOMS,silver_listings.PRICE_PER_NIGHT,silver_listings.PRICE_PER_NIGHT_TAG,silver_listings.CREATED_AT as LISTING_CREATED_AT ",
        "alias": "silver_listings",
        "join_condition": "silver_bookings.LISTING_ID = silver_listings.LISTING_ID"
    },
     {
        "table": "AIRBNB.SILVER.SILVER_HOSTS",
        "columns": "silver_hosts.HOST_NAME, silver_hosts.HOST_SINCE, silver_hosts.IS_SUPERHOST, silver_hosts.RESPONSE_RATE, silver_hosts.RESPONSE_RATE_QULAITY, silver_hosts.CREATED_AT AS HOST_CREATED_AT ",
        "alias": "silver_hosts",
        "join_condition": "silver_listings.HOST_ID = silver_hosts.HOST_ID"
    }
]

%}

select 
   {% for config in congigs %}
      {{config.columns}} {% if not loop.last %},{% endif %}
    {% endfor %}

from 
 {% for config in congigs %}
   {% if loop.first %}
      {{config.table}} AS {{config.alias}}
   {%else%}
       LEFT JOIN {{config.table}} AS {{config.alias}} ON {{config.join_condition}}
     {% endif %}
  {% endfor %}

    
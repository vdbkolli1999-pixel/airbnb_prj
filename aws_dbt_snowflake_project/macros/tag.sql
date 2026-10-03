{% macro tag(col)%}
   CASE 
     when {{ col }} <100 then 'Low'
     when {{col }} <200 then 'Med'
     Else 'High'
    END
{% endmacro%}
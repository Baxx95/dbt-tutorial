-- Macro 1: Définir une liste de pays
{% macro set_country_filter() %}
    ('US', 'FR', 'IE', 'GB', 'CA', 'AU')
{% endmacro %}

-- Macro 2: Récupérer le nombre de lignes d'une table
{% macro get_row_count(table_name) %}
    {% set query %}
        SELECT COUNT(*) AS row_count
        FROM {{ table_name }}
    {% endset %}
    
    {% set results = run_query(query) %}
    
    {% if not results %}
        {% do log('########################\n Table does not exist or query failed', info=True) %}
        {{ return(0) }}
    {% endif %}
    
    {% if results and results.columns[0].values() | length > 0 %}
        {% set row_count = results.columns[0].values()[0] %}
        {{ return(row_count) }}
    {% else %}
        {% do log('########################\n No rows found or query returned no results', info=True) %}
        {{ return(0) }}
    {% endif %}
{% endmacro %}

-- Macro 3: Filtrer par plage de dates
{% macro filter_by_date_range(use_six_months=True, col_date='order_date') %}
    {% if col_date is none or col_date == '' %}
        {{ exceptions.raise('########################\n The "col_date" parameter is required and cannot be empty.') }}
    {% endif %}
    
    {% if use_six_months %}
        WHERE {{ col_date }} >= DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH)
    {% else %}
        WHERE {{ col_date }} >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
    {% endif %}
{% endmacro %}


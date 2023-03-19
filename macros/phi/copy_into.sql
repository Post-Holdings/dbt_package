{% macro copy_into(table_name,stage_db_name,stage_schema_name,stage,pattern,fileformat,skipheader) %}

    {{ log("Loading data", True) }}
    BEGIN;
    COPY INTO {{ table_name }}
    FROM @{{ stage_db_name }}.{{ stage_schema_name }}.{{ stage }}  
    PATTERN='{{ pattern }}'
    FILE_FORMAT = (FORMAT_NAME='{{ target.database }}.{{ stage_schema_name }}.{{ fileformat }}' SKIP_HEADER = {{ skipheader }});
    COMMIT;
    {{ log("Loaded data", True) }}

{% endmacro %}
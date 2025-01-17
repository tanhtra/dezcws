with 

source as (

    select * from {{ source('staging', 'fhv_tripdata') }}

),

renamed as (

    select
        dispatching_base_num,

        -- timestamps
        cast(pickup_datetime as timestamp) as pickup_datetime,
        cast(dropoff_datetime as timestamp) as dropoff_datetime,

        pulocationid,
        dolocationid,
        sr_flag,
        affiliated_base_number

    from source
    WHERE pickup_datetime >= PARSE_TIMESTAMP('%D','01/01/19') AND
    pickup_datetime < PARSE_TIMESTAMP('%D','01/01/20');
)

select * from renamed

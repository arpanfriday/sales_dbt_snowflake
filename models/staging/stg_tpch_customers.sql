select
    c_custkey as customer_key,
    c_name as customer_name,
    c_address as customer_address,
    c_nationkey as customer_nation,
    c_phone as phone_number,
    c_acctbal as account_balance,
    c_mktsegment as market_segment,
    c_comment as comments
from {{ source('tpch', 'customer') }}
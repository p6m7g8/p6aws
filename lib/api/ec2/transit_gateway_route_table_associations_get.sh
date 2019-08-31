p6_aws_ec2_transit_gateway_route_table_associations_get() {
    local transit_gateway_route_table_id="$1"
    shift 1

    p6_run_read_cmd aws ec2 get-transit-gateway-route-table-associations --transit-gateway-route-table-id $transit_gateway_route_table_id "$@"
}
p6_aws_apigatewayv2_api_create() {
    local name="$1"
    local protocol_type="$2"
    local route_selection_expression="$3"
    shift 3

    p6_run_write_cmd aws apigatewayv2 create-api --name $name --protocol-type $protocol_type --route-selection-expression $route_selection_expression "$@"
}
p6_aws_apigatewayv2_integration_get() {
    local api_id="$1"
    local integration_id="$2"
    shift 2

    p6_run_read_cmd aws apigatewayv2 get-integration --api-id $api_id --integration-id $integration_id "$@"
}
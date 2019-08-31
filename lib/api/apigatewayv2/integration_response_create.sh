p6_aws_apigatewayv2_integration_response_create() {
    local api_id="$1"
    local integration_id="$2"
    local integration_response_key="$3"
    shift 3

    p6_run_write_cmd aws apigatewayv2 create-integration-response --api-id $api_id --integration-id $integration_id --integration-response-key $integration_response_key "$@"
}
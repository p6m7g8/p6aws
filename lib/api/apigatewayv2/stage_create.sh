p6_aws_apigatewayv2_stage_create() {
    local api_id="$1"
    local stage_name="$2"
    shift 2

    p6_run_write_cmd aws apigatewayv2 create-stage --api-id $api_id --stage-name $stage_name "$@"
}
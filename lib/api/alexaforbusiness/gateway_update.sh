p6_aws_alexaforbusiness_gateway_update() {
    local gateway_arn="$1"
    shift 1

    p6_run_write_cmd aws alexaforbusiness update-gateway --gateway-arn $gateway_arn "$@"
}
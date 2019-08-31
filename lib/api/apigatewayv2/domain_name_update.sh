p6_aws_apigatewayv2_domain_name_update() {
    local domain_name="$1"
    shift 1

    p6_run_write_cmd aws apigatewayv2 update-domain-name --domain-name $domain_name "$@"
}
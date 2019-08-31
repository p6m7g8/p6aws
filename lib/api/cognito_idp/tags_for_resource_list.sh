p6_aws_cognito_idp_tags_for_resource_list() {
    local resource_arn="$1"
    shift 1

    p6_run_read_cmd aws cognito-idp list-tags-for-resource --resource-arn $resource_arn "$@"
}
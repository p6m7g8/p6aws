p6_aws_amplify_app_create() {
    local name="$1"
    shift 1

    p6_run_write_cmd aws amplify create-app --name $name "$@"
}
p6_aws_amplify_app_update() {
    local app_id="$1"
    shift 1

    p6_run_write_cmd aws amplify update-app --app-id $app_id "$@"
}
p6_aws_cloud9_environment_update() {
    local environment_id="$1"
    shift 1

    p6_run_write_cmd aws cloud9 update-environment --environment-id $environment_id "$@"
}
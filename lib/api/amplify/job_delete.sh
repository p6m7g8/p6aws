p6_aws_amplify_job_delete() {
    local app_id="$1"
    local branch_name="$2"
    local job_id="$3"
    shift 3

    p6_run_write_cmd aws amplify delete-job --app-id $app_id --branch-name $branch_name --job-id $job_id "$@"
}
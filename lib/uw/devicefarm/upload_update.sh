aws_devicefarm_content() {
        local arn="$1"
        shift 1

    cond_log_and_run aws devicefarm update-upload --arn $arn --edit-content "$@"
}

p6_aws_devicefarm_vpce_configuration_update() {
    local arn="$1"
    shift 1

    p6_run_write_cmd aws devicefarm update-vpce-configuration --arn $arn "$@"
}
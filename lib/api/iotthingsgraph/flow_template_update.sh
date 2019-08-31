p6_aws_iotthingsgraph_flow_template_update() {
    local id="$1"
    local definition="$2"
    shift 2

    p6_run_write_cmd aws iotthingsgraph update-flow-template --id $id --definition $definition "$@"
}
p6_aws_iotthingsgraph_flow_template_revisions_get() {
    local id="$1"
    shift 1

    p6_run_read_cmd aws iotthingsgraph get-flow-template-revisions --id $id "$@"
}
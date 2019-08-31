p6_aws_glue_workflow_run_properties_put() {
    local name="$1"
    local run_id="$2"
    local run_properties="$3"
    shift 3

    p6_run_write_cmd aws glue put-workflow-run-properties --name $name --run-id $run_id --run-properties $run_properties "$@"
}
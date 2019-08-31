p6_aws_application_insights_component_delete() {
    local resource_group_name="$1"
    local component_name="$2"
    shift 2

    p6_run_write_cmd aws application-insights delete-component --resource-group-name $resource_group_name --component-name $component_name "$@"
}
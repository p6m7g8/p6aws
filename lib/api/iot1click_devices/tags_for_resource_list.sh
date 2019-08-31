p6_aws_iot1click_devices_tags_for_resource_list() {
    local resource_arn="$1"
    shift 1

    p6_run_read_cmd aws iot1click-devices list-tags-for-resource --resource-arn $resource_arn "$@"
}
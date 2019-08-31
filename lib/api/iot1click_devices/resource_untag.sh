p6_aws_iot1click_devices_resource_untag() {
    local resource_arn="$1"
    local tag_keys="$2"
    shift 2

    p6_run_write_cmd aws iot1click-devices untag-resource --resource-arn $resource_arn --tag-keys $tag_keys "$@"
}
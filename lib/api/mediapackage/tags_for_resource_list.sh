p6_aws_mediapackage_tags_for_resource_list() {
    local resource_arn="$1"
    shift 1

    p6_run_read_cmd aws mediapackage list-tags-for-resource --resource-arn $resource_arn "$@"
}
p6_aws_mediastore_tags_for_resource_list() {
    local resource="$1"
    shift 1

    p6_run_read_cmd aws mediastore list-tags-for-resource --resource $resource "$@"
}
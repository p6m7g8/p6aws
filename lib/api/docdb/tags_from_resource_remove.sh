p6_aws_docdb_tags_from_resource_remove() {
    local resource_name="$1"
    local tag_keys="$2"
    shift 2

    p6_run_write_cmd aws docdb remove-tags-from-resource --resource-name $resource_name --tag-keys $tag_keys "$@"
}
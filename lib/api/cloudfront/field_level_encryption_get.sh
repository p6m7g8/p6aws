p6_aws_cloudfront_field_level_encryption_get() {
    local id="$1"
    shift 1

    p6_run_read_cmd aws cloudfront get-field-level-encryption --id $id "$@"
}
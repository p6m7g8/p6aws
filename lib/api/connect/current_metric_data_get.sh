p6_aws_connect_current_metric_data_get() {
    local instance_id="$1"
    local filters="$2"
    local current_metrics="$3"
    shift 3

    p6_run_read_cmd aws connect get-current-metric-data --instance-id $instance_id --filters $filters --current-metrics $current_metrics "$@"
}
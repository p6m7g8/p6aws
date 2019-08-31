p6_aws_cloudwatch_anomaly_detector_delete() {
    local namespace="$1"
    local metric_name="$2"
    local stat="$3"
    shift 3

    p6_run_write_cmd aws cloudwatch delete-anomaly-detector --namespace $namespace --metric-name $metric_name --stat $stat "$@"
}
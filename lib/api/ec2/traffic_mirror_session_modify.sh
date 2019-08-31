p6_aws_ec2_traffic_mirror_session_modify() {
    local traffic_mirror_session_id="$1"
    shift 1

    p6_run_write_cmd aws ec2 modify-traffic-mirror-session --traffic-mirror-session-id $traffic_mirror_session_id "$@"
}
p6_aws_chime_voice_connector_termination_credentials_put() {
    local voice_connector_id="$1"
    shift 1

    p6_run_write_cmd aws chime put-voice-connector-termination-credentials --voice-connector-id $voice_connector_id "$@"
}
p6_aws_pinpoint_sms_voice_configuration_set_event_destination_create() {
    local configuration_set_name="$1"
    shift 1

    p6_run_write_cmd aws pinpoint-sms-voice create-configuration-set-event-destination --configuration-set-name $configuration_set_name "$@"
}
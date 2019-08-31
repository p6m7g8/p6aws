p6_aws_alexaforbusiness_profile_create() {
    local profile_name="$1"
    local timezone="$2"
    local address="$3"
    local distance_unit="$4"
    local temperature_unit="$5"
    local wake_word="$6"
    shift 6

    p6_run_write_cmd aws alexaforbusiness create-profile --profile-name $profile_name --timezone $timezone --address $address --distance-unit $distance_unit --temperature-unit $temperature_unit --wake-word $wake_word "$@"
}
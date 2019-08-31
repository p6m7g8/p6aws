p6_aws_alexaforbusiness_room_resolve() {
    local user_id="$1"
    local skill_id="$2"
    shift 2

    p6_run_write_cmd aws alexaforbusiness resolve-room --user-id $user_id --skill-id $skill_id "$@"
}
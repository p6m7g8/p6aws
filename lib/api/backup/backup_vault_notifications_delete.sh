p6_aws_backup_backup_vault_notifications_delete() {
    local backup_vault_name="$1"
    shift 1

    p6_run_write_cmd aws backup delete-backup-vault-notifications --backup-vault-name $backup_vault_name "$@"
}
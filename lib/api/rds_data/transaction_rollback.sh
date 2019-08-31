p6_aws_rds_data_transaction_rollback() {
    local resource_arn="$1"
    local secret_arn="$2"
    local transaction_id="$3"
    shift 3

    p6_run_write_cmd aws rds-data rollback-transaction --resource-arn $resource_arn --secret-arn $secret_arn --transaction-id $transaction_id "$@"
}
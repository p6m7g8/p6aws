p6_aws_budgets_budget_performance_history_describe() {
    local account_id="$1"
    local budget_name="$2"
    shift 2

    p6_run_read_cmd aws budgets describe-budget-performance-history --account-id $account_id --budget-name $budget_name "$@"
}
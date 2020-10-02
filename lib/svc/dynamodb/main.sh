p6_aws_dynamodb_svc_tables_list() {

  p6_aws_cmd dynamodb list-tables \
    --query "TableNames[]" \
    --output text
}


p6_aws_dynamodb_svc_table_describe() {
  local table_name="$1"

  p6_aws_cmd dynamodb describe-table \
    --table-name "$table_name" \
    --query "Table.AttributeDefinitions[].[AttributeType, AttributeName]" \
    --output text
}

p6_aws_dynamodb_svc_table_all() {
  local table_name="$1"

  p6_aws_cmd dynamodb scan \
    --table-name "$table_name" \
    --query "Items[]" | \
    jq -c '.[]'
}
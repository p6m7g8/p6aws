p6_aws_docdb_db_cluster_from_snapshot_restore() {
    local db_cluster_identifier="$1"
    local snapshot_identifier="$2"
    local engine="$3"
    shift 3

    p6_run_write_cmd aws docdb restore-db-cluster-from-snapshot --db-cluster-identifier $db_cluster_identifier --snapshot-identifier $snapshot_identifier --engine $engine "$@"
}
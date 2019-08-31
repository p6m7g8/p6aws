p6_aws_eks_cluster_version_update() {
    local name="$1"
    local kubernetes_version="$2"
    shift 2

    p6_run_write_cmd aws eks update-cluster-version --name $name --kubernetes-version $kubernetes_version "$@"
}
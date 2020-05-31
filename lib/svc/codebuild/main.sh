p6_aws_codebuild_svc_builds_list() {

    p6_aws_cmd codebuild \
	       list-builds \
	       --output text \
	       --query "'ids[].[]'"
}


p6_aws_codebuild_svc_projects_list() {

    p6_aws_cmd codebuild \
	       list-projects \
	       --output text \
	       --query "'projects[]'"
}

p6_aws_codebuild_svc_project_build_list() {
    local project_name="${1:-$AWS_CODEBUILD_PROJECT_NAME}"

    p6_aws_cmd codebuild \
	       list-builds-for-project \
	       --project-name \
	       --output text \
	       --query "'ids[]'"
}

p6_aws_codebuild_build_get() {
    local build_id="$1"

    p6_aws_cmd codebuild \
	       batch-get-builds \
	       --ids $build_id
}
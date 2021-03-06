######################################################################
#<
#
# Function: p6_aws_svc_ec2_volumes_list()
#
#>
######################################################################
p6_aws_svc_ec2_volumes_list() {

    local tag_name
    tag_name=$(p6_aws_cli_jq_tag_name_get)

    p6_aws_cli_cmd ec2 describe-volumes \
        --output text \
        --query "'Volumes[].[VolumeId, State, Size, AvailabilityZone, KmsKeyId, $tag_name, Attachments[0].InstanceId]'"
}

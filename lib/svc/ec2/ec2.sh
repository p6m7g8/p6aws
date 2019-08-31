p6_aws_ec2_svc_instance_show() {
    local instance_id="$1"

    p6_aws_ec2_instances_describe --instance-ids $instance_id
}

p6_aws_ec2_svc_instances_list() {
    local vpc_id="${1:-$AWS_VPC}"

    p6_aws_ec2_instances_describe \
	--output text \
	--filters "Name=vpc-id,Values=$vpc_id" \
	--query "'Reservations[].Instances[].[InstanceId, ImageId, InstanceType, SecurityGroups[].GroupId | join(\`,\` @), SubnetId, Placement.AvailabilityZone, BlockDeviceMappings[0].Ebs.VolumeId, NetworkInterfaces[0].PrivateIpAddress, KeyName, $P6_AWS_JQ_TAG_NAME, KmsKeyId, NetworkInterfaces[0].Association.PublicIp, IamInstanceProfile.Arn]'"
}

p6_aws_ec2_svc_instance_id_from_name_tag() {
    local name="$1"

    local instance_id=$(p6_aws_ec2_instances_describe \
			    --output text \
			    --filters "\"Name=tag:Name,Values=*$name*\"" \
			    --query "'Reservations[].Instances[].[LaunchTime,InstanceId]'" | \
			    sort -n | \
			    awk '{ print $2 }' | \
			    tail -1)

    p6_return "$instance_id"
}

p6_aws_ec2_svc_instance_private_ip() {
    local instance_id="$1"

    local private_ip=$(p6_aws_ec2_instances_describe \
			   --output text \
			   --instance-ids $instance_id \
			   --query "'Reservations[0].Instances[0].PrivateIpAddress'")

    p6_return "$private_ip"
}

p6_aws_ec2_svc_instance_public_ip() {
    local instance_id="$1"

    local public_ip=$(p6_aws_ec2_instances_describe \
			  --output text \
			  --instance-ids $instance_id \
			  --query "'Reservations[0].Instances[0].PublicIpAddress'")

    p6_return "$public_ip"
}

p6_aws_ec2_svc_instance_create() {
    local name="$1"
    local ami_id="$2"
    local instance_type="${3:-t3a.nano}"
    local sg_ids="$4"
    local subnet_id="$5"
    local key_name="$6"
    local user_data="${7:-}"

    [ -n "$user_data" ] && user_data="--user-data=$user_data"

    local instance_id=$(
	p6_aws_ec2_instances_run \
	    --output json \
	    --key-name $key_name \
	    --image-id $ami_id \
	    --instance-type $instance_type \
	    --security-group-ids $sg_ids \
	    --subnet-id $subnet_id \
	    $user_data
	  )

    p6_aws_ec2_tags_create  "$instance_id" "'Key=Name,Value=$name'"

    p6_return "$instance_id"
}

p6_aws_ec2_svc_launch_template_create() {
    local lt_name="$1"
    local ami_id="$2"
    local instance_type="${3:-t3a.nano}"
    local sg_ids="$4"
#    local key_name="$6"
#    local user_data="${7:-}"

    [ -n "$user_data" ] && user_data="--user-data=$user_data"

    local launch_template_data=$(p6_aws_util_template_process "ec2/launch_configuration.json" \
								     "ASSOCIATE_PUBLIC_IP_ADDRESS=true" \
								     "SECURITY_GROUPS=$sg_ids" \
								     "DELETE_ON_TERMINATE=true" \
								     "IMAGE_ID=$ami_id" \
								     "INSTANCE_TYPE=$instance_type" \
								     "TAG_NAME=$lt_name"
	  )

    p6_aws_ec2_launch_template_create "$lt_name" "'$launch_template_data'" --version-description "initial"
#    p6_aws_ec2_tags_create  "$launch_template_id" "'Key=Name,Value=$name'"
}

p6_aws_ec2_svc_launch_templates_list() {

    p6_aws_ec2_launch_templates_describe \
	--output text \
	--query "'LaunchTemplates[].[LaunchTemplateId, LaunchTemplateName, DefaultVersionNumber, LatestVersionNumber]'"
}

p6_aws_ec2_svc_volumes_list() {

    p6_aws_ec2_volumes_describe \
	--output text \
	--query "'Volumes[].[VolumeId, State, Size, AvailabilityZone, KmsKeyId, $P6_AWS_JQ_TAG_NAME, Attachments[0].InstanceId]'"
}

p6_aws_ec2_svc_key_pair_make() {
    local key_name="$1"

    local dir=$HOME/.ssh
    local key_file_pub=$dir/$key_name.pub
    local key_file_priv=$dir/$key_name

    if ! p6_aws_ec2_svc_key_pair_exists "$key_name"; then
	if p6_file_exists "$key_file_pub"; then
	    p6_aws_ec2_key_pair_import "$key_name" "file:/$key_file_pub"
	else
	    p6_aws_ec2_key_pair_create "$key_name" | tee > $key_file_priv
	fi
    fi

    # Validate!
    p6_ssh_key_check "$key_file_pub" "$key_file_pub"

    local os=$(p6_os_name)
    case $os in
	Darwin) ssh-add -K $key_file_priv ;; # XXX p6 me
    esac

    p6_return "$key_name"
}

p6_aws_ec2_svc_key_pair_delete() {
    local key_name="$1"

    local dir=$HOME/.ssh
    local key_file_pub=$dir/$key_name.pub
    local key_file_priv=$dir/$key_name

    p6_aws_ec2_key_pair_delete "$key_name"

    local os=$(p6_os_name)
    case $os in
	Darwin) ssh-add -D $key_file_priv ;;
    esac

    p6_file_rmf $key_file_pub
    p6_file_rmf $key_file_priv
}

p6_aws_ec2_svc_key_pair_exists() {
    local key_name="$1"

    local aws_key_name=$(
	p6_aws_ec2_key_pairs_describe \
	    --output text \
	    --filters Name=key-name,Values=$key_name \
	    --query "'KeyPairs[].[KeyName]'"
	  )

    if p6_string_blank "$aws_key_name"; then
	p6_return_false
    else
	p6_return_true
    fi
}

p6_aws_ec2_svc_key_pair_list() {
    local key_name="$1"

    p6_aws_ec2_key_pairs_describe \
	--output text \
	--query "'KeyPairs[]'"
}
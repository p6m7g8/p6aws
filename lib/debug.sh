######################################################################
#<
#
# Function:
#	p6_aws__debug()
#
#>
######################################################################
p6_aws__debug() {
    local msg="$1"

    p6_debug "p6_aws: $msg"

    p6_return_void
}

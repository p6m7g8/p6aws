######################################################################
#<
#
# Function: p6df::modules::p6aws::deps()
#
#>
######################################################################
p6df::modules::p6aws::deps() { 
  ModuleDeps=(
    p6m7g8/p6types
  ) 
}
######################################################################
#<
#
# Function: p6df::modules::p6aws::init()
#
#>
######################################################################
p6df::modules::p6aws::init() {

  local dir="$P6_DFZ_SRC_DIR/p6m7g8/p6aws"

  p6_bootstrap "$dir"
}

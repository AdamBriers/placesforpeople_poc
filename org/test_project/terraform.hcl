# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
#locals {
#}

terraform {
  source = "../../../modules//gsuite_enabled/"
}

# Include all settings from the root terragrunt.hcl file
#include #{
 # path = find_in_parent_folders("org.hcl")
#}

dependency "folder" {
  config_path = "../"

  # Configure mock outputs for the terraform commands that are returned when there are no outputs available (e.g the
  # module hasn't been applied yet.
  mock_outputs_allowed_terraform_commands = ["plan", "validate"]
  mock_outputs = {
    folder_id = "folder-not-created-yet"
  }
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {

  name               = "test_project"
  shared_vpc         = "gc-a-prj-vpchost-0001-3312"
  billing_account    = "012FC6-C62F56-07056F"
  folder_id          = "706244237673"
  create_project_sa  = true
  shared_vpc_subnets = "projects/gc-a-prj-vpchost-0001-3312/regions/europe-west2/subnetworks/gc-r-snet-middleware-0001

  labels = {
    application      = "test_project"
    businessunit     = "homes"
    costcentre       = "90imt"
    createdby        = "ab"
    department       = "it"
    disasterrecovery = "no"
    environment      = "rnd"
    contact          = "adam_test"
  }
}
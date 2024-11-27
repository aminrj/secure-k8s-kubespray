#!/bin/bash

# Create the infrastructure for the cluster
here="$(dirname "$(readlink -f "$0")")"
# shellcheck source=bin/common.bash
source "${here}/common.bash"

# Run the terraform script to create the infrastructure
log_info "Creating infrastructure for the cluster"
terraform_path="${here}/../terraform/aws"
pushd "${terraform_path}"
terraform init
terraform apply --var-file="credentials.tfvars" -auto-approve
popd
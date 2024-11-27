#!/bin/bash

# Remove the infrastructure for the cluster
here="$(dirname "$(readlink -f "$0")")"
# shellcheck source=bin/common.bash
source "${here}/common.bash"

# Run the terraform script to destroy the infrastructure
log_info "Destroy the infrastructure for the cluster"
terraform_path="${here}/../terraform/aws"
pushd "${terraform_path}"
terraform destroy --var-file="credentials.tfvars" -auto-approve
popd
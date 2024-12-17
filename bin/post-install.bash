#!/usr/bin/env bash

# This script will perform post-installation tasks after creating a kubernetes cluster using kubespray.

here="$(dirname "$(readlink -f "$0")")"
# shellcheck source=bin/common.bash
source "${here}/common.bash"

config_path="../inventory/secure-k8s"
declare -A config
config["inventory_file"]="${config_path}/hosts"

log_info "Get kubeconfig"
pushd "${kubespray_path}"
ansible-playbook -i "${config[inventory_file]}" \
  -e ansible_user=admin \
  -e ansible_ssh_private_key_file="~/.ssh/id_rsa_secure-k8s.pem" \
  ../playbooks/kubeconfig.yml -b

# log_info "Adding cluster-admin ClusterRoleBinding"
# ansible-playbook -i "${config[inventory_file]}" ../playbooks/cluster_admin_rbac.yml -b

# log_info "Master cis benchmark patching"
# ansible-playbook -i "${config[inventory_file]}" ../playbooks/master_cis_benchmark_patch.yml -b
# log_info "Worker cis benchmark patching"
# ansible-playbook -i "${config[inventory_file]}" ../playbooks/worker_cis_benchmark_patch.yml -b

popd

log_info "Cluster created successfully!"
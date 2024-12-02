#!/usr/bin/env bash

# This script will create a kubernetes cluster using kubespray.
# It will also install some python dependencies for kubespray in a virtual environment
# It's not to be executed on its own but rather via `ck8s-kubespray apply <wc|sc>`.

here="$(dirname "$(readlink -f "$0")")"
# shellcheck source=bin/common.bash
source "${here}/common.bash"


config_path="../inventory/secure-k8s"
declare -A config
config["inventory_file"]="${config_path}/hosts"

log_info "Creating kubernetes cluster using kubespray"
pushd "${kubespray_path}"

log_info "Running kubespray"
# ansible-playbook -i "${config[inventory_file]}" cluster.yml -b "${@}"
cd "${here}/../kubespray"
# ansible-playbook -i "${config[inventory_file]}" \
#   -e ansible_user=admin \
#   -e ansible_ssh_private_key_file="~/.ssh/id_rsa_secure-k8s.pem" \
#   --become \
#   cluster.yml

# ansible-playbook -i ../inventory/secure-k8s/hosts \
#   -e ansible_user=admin \
#   -e ansible_ssh_private_key_file="~/.ssh/id_rsa_secure-k8s.pem" \
#   --become \
#   cluster.yml

log_info "Kubespray done"

# log_info "Get kubeconfig"
ansible-playbook -i "${config[inventory_file]}" ../playbooks/kubeconfig.yml -b
# log_info "Adding cluster-admin ClusterRoleBinding"
# ansible-playbook -i "${config[inventory_file]}" ../playbooks/cluster_admin_rbac.yml -b

# log_info "Master cis benchmark patching"
# ansible-playbook -i "${config[inventory_file]}" ../playbooks/master_cis_benchmark_patch.yml -b
# log_info "Worker cis benchmark patching"
# ansible-playbook -i "${config[inventory_file]}" ../playbooks/worker_cis_benchmark_patch.yml -b

popd

log_info "Cluster created successfully!"

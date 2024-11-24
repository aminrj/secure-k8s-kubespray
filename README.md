# Secure Kubernetes Cluster Using Kubespray

## Requirements

- Terraform 0.12.0 or newer

## Setup

- Install [Terraform](https://github.com/hashicorp/terraform/releases)

```bash
ansible-playbook -e 'ansible_python_interpreter=/usr/bin/python3' --ask-become-pass --connection local --inventory 127.0.0.1, get-requirements.yaml
```

- Export the variables for your AWS credentials or edit `credentials.tfvars`:
-

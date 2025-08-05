# Show available commands
default: help

# Show available commands
help:
  @just --list --unsorted

# Initialize local dependencies (venv + Ansible)
init:
  python3 -m venv venv
  venv/bin/pip install -r requirements.txt
  @echo "Remember to source the venv: "
  @echo "  source venv/bin/activate"

[group('install')]
tags:
  ansible-playbook -i inventory.yml playbooks/dev-env.yml --list-tags

# Setup a machine for development
[group('install')]
install target="localhost" tags="all":
  ansible-playbook -i inventory.yml playbooks/dev-env.yml --ask-become-pass --limit {{ target }} --tags {{ tags }}


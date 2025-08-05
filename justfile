shell := "/bin/bash"
venv := "source venv/bin/activate"

# Show available commands
default: help

# Show available commands
help:
  @just --list --unsorted

# Initialize venv
init:
  python3 -m venv venv
  venv/bin/pip install --upgrade pip
  venv/bin/pip install -r requirements.txt
  @echo "Remember to source the venv: source venv/bin/activate"

_init:
  @just init > /dev/null

# Query inventory
list-hosts: _init
  {{ venv }} && ansible-inventory -i inventory.yml --graph

# Setup a machine for development
[group('target')]
setup-dev target="localhost" tags="all": _init
  {{ venv }} && ansible-playbook -i inventory.yml playbooks/setup-dev.yml --ask-become-pass --limit {{ target }} --tags {{ tags }}

# Enable passwordless sudo (reduces security - use only on trusted systems)
[group('target')]
easy-sudo target="localhost": _init
  {{ venv }} && ansible-playbook -i inventory.yml playbooks/easy-sudo.yml --ask-become-pass --limit {{ target }}


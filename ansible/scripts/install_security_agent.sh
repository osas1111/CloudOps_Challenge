#!/bin/sh
cd `dirname "$0"`

ENV=dev

ansible-playbook ../playbooks/basic/security_agent.yml \
  -i ../inventories/$ENV \
  -u ubuntu \
  --diff \
  --vault-password-file vault_password \
  $*

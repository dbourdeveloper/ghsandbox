#!/bin/sh

echo "$ANSIBLE_VAULT" > ~/.vault_pass.txt
mkdir ~/.ssh
echo "$ANSIBLE_PRIVATE_SSH_KEY" > ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa

export ANSIBLE_CONFIG="ansible/ansible.cfg"
# ansible-playbook -i deployment/ansible/hosts --extra-vars "webservers=$DEPLOY_ENV docker_image_hash=$DOCKER_IMG_HASH git_timestamp=$GIT_COMMIT_TIMESTAMP" deployment/ansible/playbooks/deploy.yml --vault-password-file ~/.vault_pass.txt
ansible-playbook -i ansible/inventories/hosts --extra-vars "servers=$SERVERS" ansible/playbooks/play.yml

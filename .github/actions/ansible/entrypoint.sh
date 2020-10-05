#!/bin/sh

set -e

export WORKSPACE_DIR=
if [ ! -z "$INPUT_WORKSPACE_DIR" ]
then
    WORKSPACE_DIR="${INPUT_WORKSPACE_DIR}"
else
    echo "No working space directory specified"
fi

export PLAYBOOK_DIR=
if [ ! -z "$INPUT_PLAYBOOK" ]
then
    PLAYBOOK_DIR="${INPUT_PLAYBOOK}"
else
    echo "No playbook specified"
fi

export INVENTORY=
if [ ! -z "$INPUT_INVENTORY_DIR" ]
then
    INVENTORY="-i ${INPUT_INVENTORY_DIR}"
else
    echo "No inventory specified"
fi

export SSH_KEY=
if [ ! -z "$INPUT_SSH_KEY" ]
then
    SSH_KEY="--key-file ${INPUT_SSH_KEY}"
else
    echo "No SSH key specified"
fi

export VAULT_PASSWORD=
if [ ! -z "$INPUT_VAULT_PASSWORD" ]
then
    echo "$INPUT_VAULT_PASSWORD" > ~/.vault_secrets_pw
    tilde=~
    VAULT_PASSWORD_PATH="${tilde}/.vault_secrets_pw"
    VAULT_PASSWORD="--vault-password-file ${VAULT_PASSWORD_PATH}"
else
    echo "No vault password specified"
fi

export OPTIONS=
if [ ! -z "$INPUT_OPTIONS" ]
then
    OPTIONS="$(echo "${INPUT_OPTIONS}" | tr "\n" " ")"
fi

cd ${WORKSPACE_DIR}
echo "WORKSPACE"
ls -l
echo ansible-playbook ${PLAYBOOK_DIR} ${INVENTORY} ${SSH_KEY} ${VAULT_PASSWORD} ${OPTIONS}
ansible-playbook ${PLAYBOOK_DIR} ${INVENTORY} ${SSH_KEY} ${VAULT_PASSWORD} ${OPTIONS}
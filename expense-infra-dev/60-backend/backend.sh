#!/bin/bash
component = $1
environment = $2
echo "component : $component, Environment : $environment "
dns install ansible -y
ansible-pull -i localhost, -U https://github.com/vvramadm/expense-ansible-tf.git main.yaml -e component = $component -e environment = $environment

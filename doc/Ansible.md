# Ansible
## Privilege Escalation - Become

Ansible can use existing privilege escalation systems to run tasks with root privileges if required.

* The `become: true` directive allows a task to access sudo rights.
* In the case of a password, the `--ask-become-pass` option allows execution to request (prompt) the sudo password.
* The password can also be given by the `ansible_become_password` variable.

Documentation:
* [Understanding privilege escalation: become](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_privilege_escalation.html)

## Vault
### How to add a string variable to the vault

1. Use the following command:
```shell
ansible-vault encrypt_string --output vars/vault.yml 'string_to_encrypt' --name 'variable_name'
```
2. Check the vault:
```shell
bat vars/vault.yml
```

Documentation:
* [Encrypting content with Ansible Vault](https://docs.ansible.com/ansible/latest/vault_guide/vault_encrypting_content.html)

## References

* [Best Practices](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html)
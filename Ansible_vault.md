# Ansible Vault
- in contoller `etc/ansible`:
```linux
sudo apt install python3-pip -y
sudo pip3 install awscli
sudo pip3 install boto boto3
sudo apt-get update -y
sudo mkdir group_vars
sudo mkdir all
```
- navigate to the `all` directory
```linux
ansible-vault create pass.yml
```
- when prompted to enter password choose one - `sparta` for this
- add `aws_access_key:` and `aws_secret_key:`
- now when running ansible commands add the extra, and input password when prompted:
```shell
sudo ansible web -m shell -a "uptime" --ask-vault-pass
```
- can add `--tags`: `create_ec2` for example, created inside the playbook
- use `ansible-vault edit pass.yml` to make any changes
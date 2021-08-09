- after running `vagrant up`, ssh into the controller machine `vagrant ssh controller`
- run `sudo apt-get update -y`
- repeat this process with the `web` machine and `db` machine
- again ssh into the `controller` 
- run the following commands"
```linux
sudo apt-get update -y

sudo apt-get install software-properties-common

sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update -y

sudo apt-get install ansible
```
- in `cd /etc/ansible` run `sudo apt-get install tree` to give a better file structure 
- `ping <IP>` will get response from agent nodes, or can run `ansible all -m ping` to do it via ansible
- 
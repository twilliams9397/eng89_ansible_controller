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
- wont work until `hosts` file has been configured for agent  - this file is also known as an inventory
- using `sudo nano`, add below code to the `hosts` file (make sure it is the `/etc/ansible/hosts`)
```linux
[web]
192.168.33.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant

[db]
192.168.33.11 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
```
- when running the `ping` command, it will only return success if the `hosts` file is configured correctly and the machine being pinged is live and running
- can ssh from controller into instances with the IP - `ssh vagrant@192.168.33.11` for db, password is `vagrant`
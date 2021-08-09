# Playbooks
- written in YAML language
- indentation is strict, and is case sensitive
- can be used to run commands in a certain order
- create a YAML file:
```linux
sudo nano nginx.yml
```
- Yaml files begin with `---`
```YAML
# This is a playbook to setup and install nginx in our web server(192.168.33.10)
# It is written in YAML - starts with ---
---

# name of the host

- hosts: web

# find the facts about the host

  gather_facts : yes

# need admin access

  become: true

# instructions using tasks module in ansible

  tasks:
  - name: Install Nginx

# install nginx

    apt: pkg=nginx state=present update_cache=yes

# ensure it is running/active
# update cache
# restart nginx if reverse proxy is implemented or if needed
    notify: 
     - restart nginx
  - name: Allow all access to tcp port 80
    ufw:
        rule: allow 
        port: '80'
        proto: tcp
        
  handlers:
    - name: Restart Nginx
      service: 
        name: nginx
        state: restarted
```
- to run:
```linux
ansible-playbook nginx
```
- playbook to install nodejs and dependencies:
```YAML
# Playbook to install nodejs
---

- hosts: web
  gather_facts: yes
  become: true

  tasks:
    - name: "Add nodejs apt key"
      apt_key:
        url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
        state: present

    - name: "Install nodejs"
      apt:
       update_cache: yes
       name: nodejs
       state: present
```
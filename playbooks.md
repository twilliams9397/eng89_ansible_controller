# Playbooks
- written in YAML language
- indentation is strict, and is case sensitive
- can be used to run commands in a certain order
- create a YAML file in the instance or sync an already written on in the Vagrantfile
```linux
sudo nano node_app.yml
```
- Yaml files begin with `---`
```YAML
# install nginx, nodejs, configure reverse proxy, install dependencies

---

# name of the hosts - defines where playbook will run
- hosts: web

# find the facts about the host
  gather_facts: yes

# admin access
  become: true

# instructions using task module in ansible
  tasks:
  - name: Install Nginx

# install nginx
    apt: pkg=nginx state=present update_cache=yes

-
  name: "installing nodejs"
  hosts: web
  become: true
  tasks:
    - name: "add nodejs"
      apt_key:
        url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
        state: present
    - name: add repo
      apt_repository:
        repo: deb https://deb.nodesource.com/node_13.x bionic main
        update_cache: yes
    - name: "installing nodejs"
      apt:
        update_cache: yes
        name: nodejs
        state: present
-
  name: "reverse proxy"
  hosts: web
  become: true
  tasks:
    - name: "delete current default"
      file:
        path: /etc/nginx/sites-available/default
        state: absent
    - name: "create file"
      file:
        path: /etc/nginx/sites-available/default
        state: touch
        mode: 0644
    - name: "change default file"
      blockinfile:
        path: /etc/nginx/sites-available/default
        block: |
          server{
            listen 80;
            server_name _;
            location / {
            proxy_pass http://192.168.33.10:3000;
            proxy_http_version 1.1;
            proxy_set_header Upgrade \$http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host \$host;
            proxy_cache_bypass \$http_upgrade;
            }
          }
      notify:
        - Restart nginx
    - name: update npm
      command: npm install pm2 -g -y
  handlers:
  - name: Restart nginx
    service:
      name: nginx
      state: restarted
- name: "starting app"
  hosts: web
  become: true
  tasks:
   - name: "starting node.js"
     shell: |
       cd app/
       npm install
       pm2 kill
       pm2 start app.js
```
- to run:
```linux
ansible-playbook node_app.yml
```
- before running the app, the dev_env app folder needs to be copied to the instance
- `ansible-playbook playbook_name.yml  --syntax-check` can check the syntax before running a playbook
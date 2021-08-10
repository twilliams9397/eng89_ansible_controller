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

- hosts: web
  gather_facts: yes
  become: true

  tasks:
  - name: Install Nginx
    apt: pkg=nginx state=present update_cache=yes
  
  - name: Remove nginx default file
    file:
      path: /etc/nginx/sites-available/default
      state: absent

  - name: Allow all access to tcp port 80
    ufw:
        rule: allow
        port: '80'
        proto: tcp

  - name: Create empty file
    # engages ansible file module
    file:
      # defines path for the new file 
      path: /etc/nginx/sites-enabled/reverseproxy.conf
      # creates file similar to linux touch command 
      state: touch

  - name: Insert nginx configuration for reverse proxy
    blockinfile:
      path: /etc/nginx/sites-enabled/reverseproxy.conf
      backup: yes
      block: |
        server{
          listen 80;
          server_name development.web;
          location / {
              proxy_pass http://127.0.0.1:3000;
          }
        }

  - name: Restart Nginx
    service: 
      name: nginx
      state: restarted

  - name: Create link
    file:
      src: /etc/nginx/sites-enabled/reverseproxy.conf
      dest: /etc/nginx/sites-available/reverseproxy.conf
      state: link


  - name: Install nodejs
    apt: pkg=nodejs state=present

  - name: Install NPM
    apt: pkg=npm state=present

  - name: Install pm2
    npm:
      name: pm2
      global: yes

  # - name: start app
  #   command: pm2 restart app/app.js
  # - name: seed + run app
  #   shell: |
  #   cd app/
  #   npm install
  #   node seeds/seed.js
  #   pm2 kill
  #   pm2 start app.js
```
- to run:
```linux
ansible-playbook node_app.yml
```
- before running the app, the dev_env app folder needs to be copied to the instance
- `ansible-playbook playbook_name.yml  --syntax-check` can check the syntax before running a playbook
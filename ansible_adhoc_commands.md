# Ad-hoc Commands
- can run commands in the controller to get info about the agent nodes
```linux
ansible all -a "uname -a"
```
- can put any linux commands in the " "
```linux
ansible all -a "sudo apt-get update -y"
```
- when working on international client servers check things like dates, timezone, holidays and response time before doing updates which will take down servers to minimise disruption
```linux
ansible web -m "date"
```
- above command will return date and time of web server for example
```linux
ansible all -a "free -m"
ansible all -a "df -h"
```
- above s will return information about memory of each server
```linux
ansible all -a uptime
```
- returns when a server was started and how long it has been up
```linux
ansible web -m "/sbin/reboot"
```
- reboots web server
- more commands can be found at https://docs.ansible.com/ansible/latest/user_guide/intro_adhoc.html
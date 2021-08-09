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
ansible web "date"
```
- above command will return date and time of web server for example
```linux
ansible all -a "free -m"
```
- above command will return information about memory of each server
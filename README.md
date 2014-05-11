
## Overview

A simple setup for setting up a virtual machine using vagrant and saltstack.

## Installation

### Vagrant

```bash
sudo apt-get install vagrant
```

### SaltStack

```bash
sudo add-apt-repository ppa:saltstack/salt
sudo apt-get update
sudo apt-get install salt-master
sudo apt-get install salt-minion
sudo apt-get install salt-syndic
```

## Configuration

* Edit salt/roots/pillar/users.sls and generate a new password (Default password is "password")


```bash
mkpasswd -m sha-512
```

## Starting VM

```bash
vagrant up
vagrant provision
```

## Reference

* https://docs.vagrantup.com/v2/installation/
* http://docs.saltstack.com/en/latest/topics/installation/ubuntu.html

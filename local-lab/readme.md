# Setting up an environment for learning Ansible

We will use vagrant and VirtualBox to set up a lab on our work station. Therefore, please install `vagrant` and `VirtualBox`.

In the `local-lab` folder you file a `Vagrantfile` and a bootstrapped `start.sh` shell script. Executing the `start.sh` script will install the full environment.  But let's try to understand what this does.

## Vagrant file

We will create one ansible node or controller (running on 192.168.5.61) and four worker nodes (running on 192.168.5.[71:74]). They will require 6GB of memory to run.

The worker nodes are called target-[1:4] and the controller node will be ansible-controller-1.

## SSH Key

The script expects an id_rsa public and private keys in your `~/.ssh/` folder.

## Starting the servers

* Navigate to `local-lab` folder
* Run `vagrant up` from terminal window

To remove the servers run `vagrant destroy`

To pause these servers run `vagrant suspend`

## Login into `ansible-controller-1` server

* Navigate to `local-lab` folder
* Run `vagrant ssh ansible-controller-1`


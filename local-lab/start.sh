#!/bin/bash
vagrant up

vagrant scp  ~/.ssh/id_rsa.pub  ansible-controller-1:./authorized_keys
vagrant scp  ~/.ssh/id_rsa.pub  target-1:./authorized_keys
vagrant scp  ~/.ssh/id_rsa.pub  target-2:./authorized_keys
vagrant scp  ~/.ssh/id_rsa.pub  target-3:./authorized_keys
vagrant scp  ~/.ssh/id_rsa.pub  target-4:./authorized_keys
vagrant scp  ~/.ssh/id_rsa  ansible-controller-1:./.ssh/id_rsa
vagrant scp  ~/.ssh/id_rsa.pub  ansible-controller-1:./.ssh/id_rsa.pub
vagrant scp ./resources ansible-controller-1:./
vagrant ssh ansible-controller-1  -- -t 'cat authorized_keys >> ~/.ssh/authorized_keys'
vagrant ssh target-1  -- -t 'cat authorized_keys >> ~/.ssh/authorized_keys'
vagrant ssh target-2  -- -t 'cat authorized_keys >> ~/.ssh/authorized_keys'
vagrant ssh target-3  -- -t 'cat authorized_keys >> ~/.ssh/authorized_keys'
vagrant ssh target-4  -- -t 'cat authorized_keys >> ~/.ssh/authorized_keys'

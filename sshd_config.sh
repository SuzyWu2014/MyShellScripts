#!/bin/bash
#Program:
#   This program configs /etc/ssh/sshd_config
# 2016/06/18 Shujin Wu

function addUserAsSudoer(){
    if [ -z $1 ]; then
        echo "ERROR! Please specify the user name!"
        exit -1
    else
        getent passwd $1 || useradd -d /opt/$1 -s /bin/bash $1
        sudo bash -c "echo '$1 ALL=(ALL:ALL) ALL' | (EDITOR='tee -a' visudo)"
    fi
}

function allowPwdLogin(){
    addUserAsSudoer $2
    [ -n $(grep -c 'PasswordAuthentication[[:blank:]]yes' /etc/ssh/sshd_config) ] ||
        sed -i 's/#*PasswordAuthentication[[:blank:]]no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

    if grep -q 'AllowUsers[[:blank:]]' /etc/ssh/sshd_config; then
        echo "already"
        grep "AllowUsers.*$2" /etc/ssh/sshd_config || sed -i "s/AllowUsers.*/& $2/g" /etc/ssh/sshd_config
    else
        sed -i "$ a AllowUsers $2" /etc/ssh/sshd_config
    fi
    service ssh restart
    echo "Now set the password for the $2!"
    sudo passwd  $2
}

$1 "$@"
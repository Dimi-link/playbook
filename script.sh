#!/bin/bash

docker run --name centos7 -d centos:7 sleep infinity
docker run --name ubuntu -d pycontribs/ubuntu:latest sleep infinity
docker run --name fedora -d fedora:latest sleep infinity

ansible-playbook -i inventory/prod.yml site.yml --ask-vault-password

docker stop centos7 && docker rm centos7
docker stop ubuntu && docker rm ubuntu
docker stop fedora && docker rm fedora
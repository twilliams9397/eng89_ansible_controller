#!/bin/bash

sudo apt-get update -y

export "DB_HOST=ubuntu@192.168.33.11:27017/posts?authSource=admin" >> ~/.bashrc

source ~/.bashrc
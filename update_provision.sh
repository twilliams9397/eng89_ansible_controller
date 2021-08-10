#!/bin/bash

sudo apt-get update -y

export "DB_HOST=192.168.33.11:27017/posts?authSource=admin" >> ~/.bashrc

source ~/.bashrc
#!/bin/bash

sudo apt-get update -y

export "DB_HOST=mongodb://192.168.33.11:27017/posts" >> ~/.bashrc

source ~/.bashrc
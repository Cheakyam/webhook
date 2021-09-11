#!/bin/bash

cd /root/hexo

if [ ! -d "blog" ]; then
    git clone https://github.com/Cheakyam/blog.git
fi

cd blog
git pull

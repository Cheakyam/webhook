#!/bin/bash

cd /root/hexo

if [ ! -d "blog" ]; then
    git clone git@github.com:Cheakyam/blog.git
fi

cd blog
git pull

#!/bin/sh
MAIN_DIR=$(pwd)

export LUA_PATH="/home/user/lua/?.lua;lua/?/init.lua"
export LUA_CPATH="/home/user/lua/?.so"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/user/lib

cd /home/user && lua  /home/user/main.lua

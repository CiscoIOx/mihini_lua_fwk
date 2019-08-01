# mihini_lua_fwk
Eclipse Mihini project for Sierra Wireless Lua framework

Credits: 
https://blogs.eclipse.org/post/benjamin-cab%C3%A9/introducing-mihini
https://www.eclipse.org/projects/archives.php

This github project aims to share the details on how to use Eclipse Mihini project and build it for aarch64 architecture.

# Option 1 - Workspace setup using git clone
```
$ git clone <this project>
# copy your main.lua file into this root level project dir
$ docker build -t lua_app

Note: we are using multiarch docker image with qemu-static emulation. Check out this link for how to setup qemu-user-static for differen OS
https://www.ecliptik.com/Cross-Building-and-Running-Multi-Arch-Docker-Images/
```

# Option 2 - Workspace setup (from scratch):
1. Download mihini project archive from https://www.eclipse.org/projects/archives.php
2. Extract mihini archive
3. Check for source code archives under mihini/downloads/ dir
4. Extract an archive lets say org."eclipse.mihini-incubation-0.9.zip"
5. Now under the extracted zip file dir, look for another zip file under org.eclipse.mihini-incubation-0.9/Source, extract that as well under Source dir it self.
6. Lets keep current working dir as mihini/downloads/ which has those two zip files extracted.
7. Edit the file Source/org.eclipse.mihini-incubation-0.9/cmake/toolchain.default.cmake uncomment and update below entries

```
...
# specify the cross compiler
SET(CMAKE_C_COMPILER   /usr/bin/gcc)
SET(CMAKE_CXX_COMPILER /usr/bin/g++)
...
```
8. Update mihini/downloads/eclipse.mihini-incubation-0.9/Source/org.eclipse.mihini-0.9/tools/appmon_daemon/appmon_daemon.c line number 976 from UINT16_MAX to UINT_MAX.
9. Copy rest of the files in root level of this git project to mihini/downloads/ dir.
10. Copy your main.lua file into this root level project dir
10. $ docker build -t lua_app

# IOx package descriptor file (1 network interface, 1 serial device requested)
```
descriptor-schema-version: "2.2"
info:
  name: mihini_lua_app
  version: latest
app:
  cpuarch: aarch64
  env:
    ARCH: arm64
    DOCKER_REPO: multiarch/ubuntu-core
    PATH: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    UBUNTU_SUITE: bionic
  resources:
    network:
    - interface-name: eth0
      ports: {}
    profile: custom
    cpu: 600
    memory: 256
    disk: 10
    devices:
    - label: HOST_DEV3
      type: serial
      usage: This is monitoring sensors
  startup:
    rootfs: app.ext2
    target:
    - /home/user/start.sh
  type: docker
```

# Build IOx package in linux development machine
Note: We will be building this IOx package as ext2 filesystem which requires linux development machine for rest of the steps. We need to build this app as ext2 fs due to disk space limitations on targetted Cisco platofrm (IR1101) for this app. 

1. Download ioxclient from https://developer.cisco.com/docs/iox/#!iox-resource-downloads
2. Setup ioxclient profiles using command "ioxclient profiles create" (just give defaults for now). 
3. Once the docker image is built on development machine, copy the package.yaml to working dir. Then issue below command to build IOx app from docker image

```
$ ioxclient docker package -p ext2 <previously_built_dockerimagename> . 

```
Now you should have IOx app package named "package.tar" which can be deployed on Cisco IR1101.

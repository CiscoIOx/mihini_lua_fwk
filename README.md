# mihini_lua_fwk
Eclipse Mihini project for Sierra Wireless Lua framework

Credits: 
https://blogs.eclipse.org/post/benjamin-cab%C3%A9/introducing-mihini
https://www.eclipse.org/projects/archives.php

# Workspace setup
```git clone <this project>```

# Workspace setup (from scratch):
1. Download mihini project archive from https://www.eclipse.org/projects/archives.php
2. Extract mihini archive
3. Check for source code archives under mihini/downloads/ dir
4. Extract an archive lets say org."eclipse.mihini-incubation-0.9.zip"
5. Now under the extracted zip file dir, look for another zip file under org.eclipse.mihini-incubation-0.9/Source, extract that as well under Source dir it self.
6. Lets keep current working dir as Source/ 
7. Edit the file Source/org.eclipse.mihini-incubation-0.9/cmake/toolchain.default.cmake to have below contents

```# this one is important
#SET(CMAKE_SYSTEM_NAME Linux)
#this one not so much
#SET(CMAKE_SYSTEM_VERSION 1)

# specify the cross compiler
SET(CMAKE_C_COMPILER   /usr/bin/gcc)
SET(CMAKE_CXX_COMPILER /usr/bin/g++)

# where is the target environment
#SET(CMAKE_FIND_ROOT_PATH  /opt/kerlink/)

# search for programs in the build host directories
#SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
#SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
#SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

SET(DEFAULT_BUILD true)
```

#*******************************************************************************
# Copyright (c) 2012 Sierra Wireless and others.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
# Contributors:
#     Sierra Wireless - initial API and implementation
#*******************************************************************************

# this one is important
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


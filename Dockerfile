FROM multiarch/ubuntu-core:arm64-bionic AS builder
# libreadline5-dev not availble, apt-get recommends to use libreadline-gplv2-dev
RUN apt-get update && apt-get install -y cmake build-essential libreadline-gplv2-dev
# docker run --rm -it -v $PWD:/home/user/ mihini_build_env bash
# appmon_daemon.c:976:22: error: 'UINT16_MAX'
# updated toolchain.default.cmake
COPY $PWD/org.eclipse.mihini-incubation-0.9/Source/ /home/user/
WORKDIR /home/user/
RUN ./org.eclipse.mihini-0.9/bin/build.sh

FROM multiarch/ubuntu-core:arm64-bionic
RUN apt-get -y update && apt-get -y install lua5.1 lua-socket lua-sec vim
COPY --from=builder /home/user/build.default/runtime/lua /home/user/lua/
COPY --from=builder /home/user/build.default/runtime/lib /home/user/lib/
COPY start.sh /home/user/
COPY main.lua /home/user/
RUN chmod +x /home/user/start.sh
CMD ["/home/user/start.sh"]

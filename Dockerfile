FROM gcc

# install python
RUN apt update
RUN apt install -y python3 python3-pip python3-venv sudo

# go to the project
WORKDIR /usr/mybcp

# set up user, so generated files are owned properly.
# we dont really care about the home directory, it just has to match the compose file
ARG REMOTE_UID
ARG REMOTE_GID
ARG REMOTE_USER
ENV DEBIAN_FRONTEND=noninteractive

# if we run in a dev container, don't bother setting up a user
RUN addgroup --gid "${REMOTE_GID?:REMOTE_GID not set}" "${REMOTE_USER?:REMOTE_USER not set}" && \
    adduser --gid "${REMOTE_GID}" --uid "${REMOTE_UID?:REMOTE_UID not set}" --home /home/mybcp "${REMOTE_USER}" && chown -R ${REMOTE_USER?:}:${REMOTE_USER?:} /home/mybcp && \
    adduser "${REMOTE_USER}" sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# system build dependencies
RUN apt install -y libegl-dev libegl1-mesa-dev xkb-data libx11-xcb-dev libfontenc-dev libxaw7-dev libxcomposite-dev libxcursor-dev libxdamage-dev libxfixes-dev libxi-dev libxinerama-dev libxkbfile-dev libxmu-dev libxmuu-dev libxpm-dev libxrandr-dev libxres-dev libxss-dev libxtst-dev libxv-dev libxxf86vm-dev libxcb-glx0-dev libxcb-render-util0-dev libxcb-xkb-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-shape0-dev libxcb-sync-dev libxcb-xfixes0-dev libxcb-xinerama0-dev libxcb-dri3-dev libxcb-cursor-dev libxcb-dri2-0-dev libxcb-dri3-dev libxcb-present-dev libxcb-composite0-dev libxcb-ewmh-dev libxcb-res0-dev libxcb-util-dev libxcb-util0-dev

# activate user (will silently fail if not set aka running as dev container)
USER ${REMOTE_USER}

ENTRYPOINT ./entrypoint.sh

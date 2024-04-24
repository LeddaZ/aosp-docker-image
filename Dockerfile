FROM ubuntu:22.04
ARG userid
ARG groupid
ARG username

RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Europe/Rome apt-get -y install tzdata

RUN apt-get install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32readline-dev lib32z1-dev libelf-dev liblz4-tool libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev lib32ncurses5-dev libncurses5 libncurses5-dev python-is-python3 && apt-get clean

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo

RUN chmod a+x /usr/local/bin/repo

RUN groupadd -g "$groupid" "$username" \
 && useradd -m -u "$userid" -g "$groupid" "$username" \
 && echo "$username" >/root/username \
 && echo "export USER=$username" >>/home/"$username"/.gitconfig
COPY gitconfig /home/$username/.gitconfig
RUN chown "$userid":"$groupid" /home/"$username"/.gitconfig
ENV HOME=/home/$username
ENV USER=$username

ENTRYPOINT chroot --userspec=$(cat /root/username):$(cat /root/username) / /bin/bash -i

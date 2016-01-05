#!/bin/bash

set -ex


for i in {0..6}
do
    mknod -m0660 /dev/loop$i b 7 $i
done

# start the docker daemon
/usr/local/bin/wrapdocker &

# start the ssh daemon
/usr/sbin/sshd -D
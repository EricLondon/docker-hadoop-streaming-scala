#!/bin/sh

if [ ! -f '/root/scala-2.11.8.tgz' ]; then
  cd /root
  wget http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz
fi

if [ ! -d '/root/scala-2.11.8' ]; then
  cd /root
  tar -xzf scala-2.11.8.tgz
fi

cp -r /root/scala-2.11.8 /usr/local/share/scala

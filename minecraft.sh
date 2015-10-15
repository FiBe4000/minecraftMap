#!/bin/sh
screen -X -S minecraft quit
set -e
cd ~/minecraftServer/world/
git pull
cd ..
gnome-terminal -e "screen -S "minecraft""
sleep 1
screen -S minecraft -p 0 -X stuff "`printf "java -Xmx4096M -Xms1024M -jar minecraft_server.jar nogui\r"`";
java -jar ~/minecraft.jar
cd world/
screen -S minecraft -p 0 -X stuff "`printf "/stop\r"`"; sleep 3
screen -X -S minecraft quit
date > currentDate
git commit -a -F currentDate
git push
rm currentDate
cd ~


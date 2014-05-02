#!/bin/sh
# http://www.scala-sbt.org/release/docs/Getting-Started/Setup.html
# default location of files is ~/.sbt/boot
# configurable with `java -Dsbt.boot.directory=path/to/boot/`
SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
java $SBT_OPTS -jar `dirname $0`/sbt-launch.jar "$@"

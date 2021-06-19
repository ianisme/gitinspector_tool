#!/bin/sh

START=`date -j -f %Y-%m-%d:%H.%M $1:0.0 +%s`
END=`date -j -f %Y-%m-%d:%H.%M $2:0.0 +%s`
for dir in `ls`; do
 PWD=`pwd`
 echo ${PWD}/$dir;
 if [ -d ${PWD}/$dir ];then
  echo "ok";
 else
    continue
 fi
 cd $dir;
 echo $dir;
 gitinspector --timeline=true --weeks=true --format=text --since=${START} --until=${END} > ${START}.text
 cd ..
done;

echo "全部完成"

exit 0


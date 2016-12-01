#!/bin/sh

/etc/bootstrap.sh

cd $HADOOP_PREFIX

# prepare hdfs files:
bin/hdfs dfsadmin -safemode leave
bin/hdfs dfs -mkdir /scala_in
bin/hdfs dfs -put /root/words /scala_in
bin/hdfs dfs -rmdir /scala_out

# execute hadoop streaming job
bin/hadoop jar share/hadoop/tools/lib/hadoop-streaming-2.7.0.jar \
  -mapper "/root/mapper.sh" \
  -reducer "/root/reducer.sh" \
  -input "/scala_in" \
  -output "/scala_out"

# hdfs output
bin/hdfs dfs -cat /scala_out/part-00000

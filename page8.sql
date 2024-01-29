  --driver-memory 2g --driver-cores 1 \
  --conf spark.driver.memoryOverhead=512m \
  --executor-memory 5g --num-executors 4 --executor-cores 8 \
  --conf spark.executor.memoryOverhead=512m \
  --conf spark.memory.offHeap.enabled=true --conf spark.memory.offHeap.size=512m \



set spark.driver.memory=1g;
set spark.driver.memoryOverhead=256m;
set spark.executor.num=1;
set spark.executor.cores=1;
set spark.executor.memory=4g;
set spark.executor.memoryOverhead=256m;
set spark.memory.fraction=0.01;




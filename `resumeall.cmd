bash -c "for pid in `procfs.cmd | awk '{print $1}'| sort | uniq`; do echo pssuspend -r $pid; done" | do 2>&1 | grep resumed

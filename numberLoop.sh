#! /usr/bin/bash

MAXTERM=10
for i in $(seq 0 $MAXTERM); do # in [0, $MAXTERM]
    echo -n "${i} "
done

echo
exit 0
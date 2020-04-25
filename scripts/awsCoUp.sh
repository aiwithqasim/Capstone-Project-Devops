#!/bin/bash

if ./awsCreate.sh $1 $2 $3 ; then
    echo "Create succeeded"
elif ./awsUpdate.sh $1 $2 $3 ; then
    echo "Update succeeded"
else
    echo "CoUp failed"
fi
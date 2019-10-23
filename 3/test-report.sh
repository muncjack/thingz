#!/bin/bash 


python  do-requests.py | awk '{v=int($1);if(v > n){m=v};count ++;total= total + $1};END{print "avg time: " int(total/count); print "max time: " m}'

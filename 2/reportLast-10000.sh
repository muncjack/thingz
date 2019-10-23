#!/bin/bash 

tail -n 10000 $1 | sed -r -e  's/^[0-9\.]+\s\S[^"]+"[^"]+"\s+[^"]+"[^"]+"\s+"[^"]+"\s([0-9]*).*/\1/'  | awk -v m5=0 -v m2=0 -v s=0 '
{
count++;total=total + int($1)
if($1 >= 1000000){s++}
else{if($1 >= 200000){m2 ++}else{if($1 >= 500000){m5 ++}}}};
END{r = int(total/count);print "average time: " r;print "more then 1s: " s;print "more then 200ms: " m2;print "more then 500ms: " m5;}'


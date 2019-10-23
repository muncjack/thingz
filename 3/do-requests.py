#!/bin/python

from urlparse import urlparse
from threading import Thread
import httplib, sys
from Queue import Queue
import time 

concurrent = 100

def doWork():
    while True:
        url = q.get()
        geturl(url)
        q.task_done()

def geturl(ourl):
        url = urlparse(ourl)
        conn = httplib.HTTPConnection(url.netloc)   
        stime = time.time()
        conn.request("HEAD", url.path)
        res = conn.getresponse()
        etime = time.time()
	t = etime - stime 
        print(round(t * 1000))


q = Queue(concurrent )
for i in range(concurrent):
    t = Thread(target=doWork)
    t.daemon = True
    t.start()

try:
    for i in range(100):
        q.put("https://google.com")
    q.join()
except KeyboardInterrupt:
    sys.exit(1)

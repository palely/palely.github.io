# -*- coding:utf-8 -*- 

from BaseHTTPServer import HTTPServer
from CGIHTTPServer import CGIHTTPRequestHandler

httpd = HTTPServer(('', 8000), CGIHTTPRequestHandler)

print "server run on localhost:8000"

httpd.serve_forever()
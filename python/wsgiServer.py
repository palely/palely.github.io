# -*- coding:utf-8 -*- 

from wsgiref.simple_server import make_server

import index

def hello_world_app(environ, start_response):
    reload(index)
    return index.hello_world_app(environ, start_response)

httpd = make_server('', 8000, hello_world_app)

print "Serving on port 8000..."

httpd.serve_forever()
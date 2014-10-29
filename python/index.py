# -*- coding:utf-8 -*- 

def hello_world_app(environ, start_response):
    status = '200 OK'
    headers = [('Content-type', 'text/plain')]
    start_response(status, headers)
	
    # The returned object is going to be printed
    return ["Hello World12"]
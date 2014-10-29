# -*- coding:utf-8 -*- 

print 'Content-Type:text/html; charset=utf-8'
print ''

import sys
reload(sys)
sys.setdefaultencoding('utf-8') 

# stdout = sys.stdout
# sys.stdout = open('test.txt','w')
# sys.stdout = stdout

sys.stderr = sys.stdout

print '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'
print '<html>'
print '<head>'
print '<title>hello</title>'
print '</head>'
print '<body>'
print '<h1>hello安</h1>'

import cgi, os
form = cgi.FieldStorage()

print "<p>name:", form["name"]
print "<p>addr:", form["addr"].value

if 'file' in form:
	fileitem = form['file']
	if fileitem.filename:
		fn = os.path.basename(fileitem.filename)
		open('tmp/' + fn, 'wb').write(fileitem.file.read())
		message = 'The file "' + fn + '" was uploaded successfully'
		print '</pre>'
	

print """
<form action="" method="post" enctype="multipart/form-data">
	<input name="file" type="file" />
	<input name="name" type="text" />
	<input name="submit" type="submit" />
</form>
"""
	
print '</body>'
print '</html>'

# sys.stdout.close()

# sys.stdout = stdout
# print open('test.txt','r').read()
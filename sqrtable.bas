dim d as integer
dim c as integer
dim a as integer
dim b as integer
dim s as string
dim w as integer=255
dim ww as integer=10
dim lline as integer=10
color 0,2

print "int divs[]={"
d=0
	for a=0 to w
		print "";
		
			print int(sqr(a)) ;
		
		print ",";
		d=d+1
		if d=lline then 
			d=0
			print 
		end if
	next

print "0};"

dim d as integer
dim c as integer
dim a as integer
dim b as integer
dim s as string
dim w as integer=255
dim ww as integer=0
dim lline as integer=5
color 0,2

print "int hexss[]={"
d=0
	for a=0 to w
		s="00"+hex(a)
		s=right(s,2)
		for b=1 to 2
			print "";
				print asc(mid(s,b,1)) ;
		
			print ",";
		next
		d=d+1
		if d=lline then 
			d=0
			print 
		end if
	next

print "0};"

dim d as integer
dim c as integer
dim a as integer
dim b as integer
dim s as string
dim w as integer=10
dim ww as integer=10
dim lline as integer=10
color 0,2

print "int muls[]={"
d=0
for b=0 to ww
	for a=0 to w
		print "";
		print a*b ;
		print ",";
		d=d+1
		if d=lline then 
			d=0
			print 
		end if
	next
next
print "0};"

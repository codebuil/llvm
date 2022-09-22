dim a as double
dim b as double
dim s as string
dim w as double=100
const maxs=360
const pi=3.1415927
color 0,2
print "double pi=3.1415927;"
a=0
print "double coss[]={"
for b=0.00 to 360.00
	a=0.00+w*cos(b/(maxs/2.00)*pi)
	print "";
	print a ;
	print ",";
	a=b/15
	if a*15=b then 
		print 
	end if
	
next
print "0.00};"
print "double sinn[]={"
for b=0.00 to 360.00
	a=0.00+w*sin(b/(maxs/2.00)*pi)
	print "";
	print a ;
	print ",";
	a=b/15
	if a*15=b then 
		print 
	end if
	
next
print "0.00};"

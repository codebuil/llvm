dim xy as integer
dim x as integer
dim y as integer
dim xx as integer
dim yy as integer
dim a as string
dim b as string
color 0,2
print
print "file image to array ? : " ;
input a
b=a+".txt"
print b
print "image x size to array ? : " ;
input x
print "image y size to array ? : " ;
input y
print x,y
screen 13
line (0,0)-(320,200),2,bf
bload a
open b for output as 1
for yy=0 to y-1
	a=""
	for xx=0 to x-1
		xy=point(xx,yy)
		a=a+str(xy)+" , "
		pset(xx,yy),2
	next
	print #1,a
	a=""
next
close

dim a as integer
dim b as integer
dim c as integer
dim s as string
dim sss as string 
dim ss as string 
dim i as integer
color 0,2
print "file to convert to array? : ";
input s
open s for input as 1
a=0
for b=0 to 8000
	input #1,sss
	for c=0 to len(sss)-1
a=a+1
if a=5 then 
	a=0
	print
end if
		ss=ss+chr(13)
		ss=mid(sss,c+1,1)
		i=asc(ss)
		if i<32 or i>127 then ss=" "
		print "'" ;
		print ss;
		print "'," ;
	next
if eof(1) then goto exits
next
exits:
close 1

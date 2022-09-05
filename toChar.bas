dim a as integer
dim b as integer
dim s as string
color 0,2
print "string to convert to char? : ";
input s
a=0
for b=0 to len(s)-1
a=a+1
if a=5 then 
	a=0
	print
end if

	print asc(mid(s,b+1,1));
	print ",";

next

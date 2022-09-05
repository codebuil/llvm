dim shared t as integer=0
dim shared i as integer
dim shared p as integer ptr
dim shared sss as integer=0
function rad(a as integer)as integer
	if a=0 or sss>80 then 
		sss=0
		*p=cast(integer,@rad)+sss
	end if
	sss=sss+1
	return *p 
end function

function main()as integer
	dim a as integer
	rad(0)
	color 0,2
	for a=0 to 50
		print rad(1)
	next
	return 0
end function

main

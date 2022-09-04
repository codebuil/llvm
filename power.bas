function power(a as integer, b as integer )as integer
	dim c as integer
	dim d as integer
	d=a
	if b=0 then return 1
	if b=1 then return a
	for c=0 to b-2
		d=d*a
	next  
	return d
end function

function main()as integer
	dim a as integer
	color 0,2
	for a=0 to 8
		print power(2,a)
	next
	return 0
end function

main

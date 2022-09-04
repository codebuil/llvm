function min(a as integer, b as integer )as integer
	if a>b then 
		return b
	else
		return a
	end if
	return a
end function

function main()as integer
	color 0,2
	print min(20,30)
	return 0
end function

main

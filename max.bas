function max(a as integer, b as integer )as integer
	if a>b then 
		return a
	else
		return b
	end if
	return a
end function

function main()as integer
	color 0,2
	print max(20,30)
	return 0
end function

main

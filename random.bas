function rad(a as integer)as integer
	if a=0 then
		return int(rnd()*500)
	else
		return int(rnd()*300)
	end if
	return int(rnd()*300)	
end function

function main()as integer
	color 0,2
	print rad(0)
	print rad(1)
	return 0
end function

main

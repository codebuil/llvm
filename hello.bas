function hello()as zstring ptr
	dim s as zstring ptr 
	s=allocate(50)
	*s="hello word"
	return s
end function
sub main()
	color 2
	print *hello()
end sub
main

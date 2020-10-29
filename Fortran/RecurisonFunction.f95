!!Factorials through Fortran Functions

program fact1

    integer(16) :: val, i
    integer(16) :: fact
    external fact
    
    do i = 1, 20
      print *, i, fact(i)
    enddo
    
    end program fact1
    
    
    recursive integer(16) function fact( i ) result (val)
    
    integer(16) :: i
    
    if ( i /= 1 ) then
      val = i * fact(i-1)
    else
      val = 1
      return
    endif
    
    end function fact

    
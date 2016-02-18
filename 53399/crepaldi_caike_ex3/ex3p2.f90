program not_a_number
  implicit none
  real :: p=1.0,n=-1.0,z=0.0 !positive, negative and zero numbers
  real :: res

  res = sqrt(n)

  if (res/=res) then
     print *, "Result of the square-root of a negative number is:"
     print *, res, ", and it is not equal to itself."
  end if

  res = z/z

  if (res/=res)then
     print *, "Result of the division of two zero numbers is:"
     print *, res, ", and it is not equal to itself."
  end if

end program not_a_number

program realproperties
  implicit none
  real(kind=4) :: a
  real(kind=8) :: b
  real(kind=10) :: c
  real(kind=16) :: d

  print *, "KIND = 4"
  print *, "Significant digits:", DIGITS(a)
  print *, "Decimal precision:", PRECISION(a)
  print *, "Smallest positive number that can be represented by this kind:"&
       , TINY(a)
  print *, "Largest number that can be represented by this kind:"&
       , HUGE(a)

  print*, "KIND = 8"
  print*, "Significant digits:", DIGITS(b)
  print*, "Decimal precision:", PRECISION(b)
  print*, "Smallest positive number that can be represented by this kind:"&
       , TINY(b)
  print*, "Largest number that can be represented by this kind:"&
       , HUGE(b)

  print*, "KIND = 10"
  print*, "Significant digits:", DIGITS(c)
  print*, "Decimal precision:", PRECISION(c)
  print*, "Smallest positive number that can be represented by this kind:"&
       , TINY(c)
  print*, "Largest number that can be represented by this kind:"&
       , HUGE(c)

  print*, "KIND = 16"
  print*, "Significant digits:", DIGITS(d)
  print*, "Decimal precision:", PRECISION(d)
  print*, "Smallest positive number that can be represented by this kind:"&
       , TINY(d)
  print*, "Largest number that can be represented by this kind:"&
       , HUGE(d)

end program realproperties

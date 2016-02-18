program harmonicsum
  implicit none
  integer :: n,m
  real(kind=4) :: hsum4=0.0_4
  real(kind=8) :: hsum8=0.0_8
  real(kind=10) :: hsum10=0.0_10
  real(kind=16) :: hsum16=0.0_16

  print *, "Set a value for the Sum upper limit (M):"
  read(5,*) m
  
  do n=1,m
     hsum4=hsum4+1.0_4/real(n,8)
  end do
  print *, "KIND = 4, Harmonic sum =", hsum4
  do n=1,m
     hsum8=hsum8+1.0_8/real(n,8)
  end do
  print *, "KIND = 8, Harmonic sum =", hsum8
  do n=1,m
     hsum10=hsum10+1.0_10/real(n,10)
  end do
    print *, "KIND = 10, Harmonic sum =", hsum10
  do n=1,m
     hsum16=hsum16+1.0_16/real(n,16)
  end do
  print *, "KIND = 16, Harmonic sum =", hsum16

end program harmonicsum

module gauss
  implicit none

contains

  real function gauss_int(f,a,b)
    real, intent(in) :: a,b
    real :: c,d
    real, external :: f

    c = (a+b)/2
    d = (b-a)/(2*sqrt(3.0))

    gauss_int = (b-a)/2 * (f(c - d) + f(c + d))

  end function gauss_int

end module gauss

program test
  use gauss
  implicit none
  intrinsic :: sin

  print *, gauss_int(sin,0.0,1.0)

end program test

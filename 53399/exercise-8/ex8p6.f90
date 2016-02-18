program test_func
  implicit none
  intrinsic :: sin, cos, tan

  print *, rads(sin,30.0)
  print *, rads(sin,45.0)
  print *, rads(sin,60.0)
  print *, rads(cos,30.0)
  print *, rads(cos,45.0)
  print *, rads(cos,60.0)
  print *, rads(tan,30.0)
  print *, rads(tan,45.0)
  print *, rads(tan,60.0)

contains

  real function rads(f,x)
    implicit none
    real, intent(in) :: x
    real, parameter :: pi=4.0*atan(1.0)
    real, parameter :: deg2rad=pi/180.0
    real, external :: f

    rads=f(deg2rad*x)

  end function rads

end program test_func

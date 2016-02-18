module dertypvec
  implicit none
  type :: vector
     real :: x,y
  end type vector
  interface operator(.vcos.)
     module procedure vectorcos
  end interface operator(.vcos.)
contains
  real function dot(v,u)
    implicit none
    type (vector), intent(in) :: v,u

    dot = v%x*u%x+v%y*u%y
  end function dot
  
  real function vectorcos(v,u)
    implicit none
    type (vector), intent(in) :: v,u

    vectorcos= (dot(v,u))/(sqrt(dot(v,v))*sqrt(dot(u,u)))

  end function vectorcos
end module dertypvec

program test_type
  use dertypvec
  implicit none
  type (vector) :: a,b,c,d,e,f

  a=vector(0,1)
  b=vector(1,1)
  c=vector(-1,1)
  d=vector(1,-1)
  e=vector(7,3)
  f=vector(3,2)

  print *, a.vcos.b
  print *, c.vcos.d
  print *, e.vcos.f

end program test_type

  

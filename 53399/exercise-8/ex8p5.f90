module geomseries
  implicit none
  real, allocatable :: a(:)

contains

  function geom_series(start,coeff,n)
    implicit none
    real, allocatable :: geom_series(:)
    real, intent(in) :: start, coeff
    integer, intent(in) :: n
    integer :: i

    allocate(geom_series(n))

    geom_series(1)=start

    do i=1,n-1
       geom_series(i+1)=start*(coeff**i)
    end do

  end function geom_series

end module geomseries

program test_mod
  use geomseries
  implicit none
  real :: start=0.5, coeff=0.5
  integer :: n=4

  a=geom_series(start,coeff,n)

  print *, a

end program test_mod

    

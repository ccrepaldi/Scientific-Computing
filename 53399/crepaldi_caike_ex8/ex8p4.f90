program tetration_test
  implicit none
  ! real :: a
  ! integer :: n

  print *, tetrat(5.0,3)
  print *, tetrat(2.2,3)
  print *, tetrat(2.0,0)
  print *, tetrat(2.0,1)
  print *, tetrat(2.0,2)
  print *, tetrat(2.0,4)

contains

  real function tetrat(a,n)
    implicit none
    real, intent(in) :: a
    integer, intent(in) :: n
    real :: f
    integer :: i

    sel: select case (n)
    case (0)
       f=1
    case (1)
       f=a
    case default
       f=a
       do i=1,n-1
          f=a**f
       end do
    end select sel

    tetrat=f

  end function tetrat

end program tetration_test


       

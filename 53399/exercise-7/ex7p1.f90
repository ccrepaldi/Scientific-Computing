program factorial_test
  implicit none
  integer :: i, f

  i=10

  f=fact(i)

  print *, f

contains

  integer function fact(n)
    implicit none
    integer, intent(in) :: n
    integer :: i, factorial

    factorial=1
    do i=1,n
       factorial=factorial*i
    end do
    fact=factorial
  end function fact

end program factorial_test

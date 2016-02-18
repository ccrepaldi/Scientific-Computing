program sin_test
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  real(kind=dp) :: x, sum

  x=0.5

  print *, trim('Sin(x) with 2 terms:'), sin_mod(x,2)
  print *, trim('Sin(x) with 4 terms:'), sin_mod(x,4)
  print *, trim('Intrinsic Sin(x):'), sin(x)

contains

  real function sin_mod(x,n)
    implicit none
    integer, parameter :: dp = selected_real_kind(15, 307)
    real(kind=dp), intent(in) :: x
    real(kind=dp) :: sum
    integer, intent(in) :: n
    integer :: k

    sum=0.0

    do k=0,n
      sum = sum + (-1)**k * x**(2*k+1)/fact(2*k+1)
    end do

    sin_mod=sum

  end function sin_mod

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

end program sin_test

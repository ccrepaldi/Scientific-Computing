program test_epsilon
  implicit none
  real(kind=10) :: x

  print *, "KIND = 10, epsilon =", epsilon(x)
  print *, "epsilon + 1 =", epsilon(x)+1
  print *, "epsilon/2 + 1 =", (epsilon(x)/2)+1
  print *, ""
  print *, "Using subtraction instead of addition:"
  print *, "epsilon - 1 =", epsilon(x)-1
  print *, "epsilon/2 - 1 =", (epsilon(x)/2)-1

end program test_epsilon

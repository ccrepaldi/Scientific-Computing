program main
  use cmd_line
  implicit none
  integer :: i

  i=1

  print *, trim('Integer value: '), cmd2int(i)
  print *, trim('Real(rk) value: '), cmd2real(i)

end program main

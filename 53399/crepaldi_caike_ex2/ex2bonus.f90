program bit_output
  implicit none
  integer(1) :: i

  print *, "Set a value for the 1-byte integer number:"
  read(5,*) i

  print *, "The 8-bit representation of your number is:"

  write(6,'(b8.8)') i

end program bit_output

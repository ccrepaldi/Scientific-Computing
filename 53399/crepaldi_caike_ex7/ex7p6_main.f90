program ackermann
  use ackermannfunc
  implicit none

  write(6,*) trim('A(1,2) ='), ack(1,2)
  write(6,*) trim('A(2,3) ='), ack(2,3)
  write(6,*) trim('A(3,2) ='), ack(3,2)
  write(6,*) trim('A(4,1) ='), ack(4,1)

end program ackermann

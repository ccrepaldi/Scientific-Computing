program obiwankenobi
  implicit none
  integer :: i, itcount=0

  write(6,*) "Loop 1"

  do i=1,5
     itcount=itcount+1
     write(6,*) "Iteraction count =", itcount
     write(6,*) "i value =", i
  end do
  write(6,*) "i value after the do construct=", i
  itcount=0

  write(6,*) "Loop 2"

  do i=5,0,-1
     itcount=itcount+1
     write(6,*) "Iteraction count =", itcount
     write(6,*) "i value =", i
  end do
  write(6,*) "i value after the do construct=", i
  itcount=0

  write(6,*) "Loop 3"
  
  do i=10,1,-2
     itcount=itcount+1
     write(6,*) "Iteraction count =", itcount
     write(6,*) "i value =", i
  end do
  write(6,*) "i value after the do construct=", i
  itcount=0

  write(6,*) "Loop 4"

  do i=0,30,7
     itcount=itcount+1
     write(6,*) "Iteraction count =", itcount
     write(6,*) "i value =", i
  end do
  write(6,*) "i value after the do construct=", i
  itcount=0
  
end program obiwankenobi

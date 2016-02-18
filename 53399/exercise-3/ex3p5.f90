program array_subobjects
  implicit none
  integer :: a(1,4), b(3,3), c(4,4)
  integer :: m(16),i

  m = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

  a = reshape(m(:4),[1,4])
  b = reshape(m(:9),[3,3])
  c = reshape(m,[4,4])

  print *, "Array a:"
  write(6,*) a

  print *, "Array a subobject:"
  write(6,*) a(1,3:)

  print*, "Array b:"
  do i=1,3
     write(6,*) b(i,:)
  end do
  
  print*, "Array b subobject:"
  do i=1,3,2
     write(6,*) b(i,1:3:2)
  end do

  print*, "Array c:"
  do i=1,4
     write(6,*) c(i,:)
  end do

  print*, "Array c subobject:"
  do i=2,3
     write(6,*) c(i,2:3)
  end do

end program array_subobjects

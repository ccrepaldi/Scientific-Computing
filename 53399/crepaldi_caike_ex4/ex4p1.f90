program checkerboard
  implicit none
  integer, dimension(10,10) :: a
  integer :: i

  do i=1,10,2
     a(i,:)=[0,1,0,1,0,1,0,1,0,1]
  end do
  do i=2,10,2
     a(i,:)=[1,0,1,0,1,0,1,0,1,0]
  end do
     
  write(6,'(10(i0,x))') a

end program checkerboard

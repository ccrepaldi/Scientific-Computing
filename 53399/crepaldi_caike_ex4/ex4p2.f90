program declare_array
  implicit none
  integer :: i
  integer, dimension(3,4) :: a

  a(1,:)=[1,2,3,4]
  a(2,:)=[5,6,7,8]
  a(3,:)=-2

  do i=1,3
     write(6,*) a(i,:)
  end do

end program declare_array

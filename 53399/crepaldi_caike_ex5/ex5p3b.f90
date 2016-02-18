program read_file
  implicit none
  integer, allocatable :: a(:)
  integer n,i

  open(unit=2,file='unf.data',form='unformatted', access='stream',status='old',action='read')
  read(2) n
  ALLOCATE(a(n))
  do i=1,n
     read(2) a(i)
  end do
  close(2, status='keep')


  write(6,'(i2)') a(:)
  
end program read_file

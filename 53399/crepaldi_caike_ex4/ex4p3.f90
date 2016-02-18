program ex4p3
  implicit none
  integer,parameter :: n=10
  real :: a(n,n)
  integer :: i

  ! --- For the RNG
  integer :: s
  integer,allocatable :: seed(:)

  ! ---- Start of RNG setup
  
  ! Set up the seed
  call random_seed(size=s)
  allocate(seed(s))
  seed=1277345
  call random_seed(put=seed)
  ! Fill array a with random numbers
  ! in the interval [0,1[
  call random_number(a)

  ! ---- End of RNG setup

  ! Your additions come here.

  write(6,'(10(f8.3))') a
  write(6,*) "--------MODIFICATION---------"
  
  where (a.LT.0.5)
     a=0.0
  elsewhere (a.LE.0.75.AND.a.GE.0.5)
     a=0.75
  elsewhere
     a=a
  end where
  
  write(6,'(10(f8.3))') a
  
end program ex4p3

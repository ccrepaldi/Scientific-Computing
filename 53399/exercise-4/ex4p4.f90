program ex4p4
  implicit none
  real :: a(6,10)
  character(len=10) :: c(4)
  complex :: z(20)
  
  call assign_values()

  ! Put the print statements here.

  print '(6(f9.6))', a
  print '(a10)', c
  print '(f10.6," + ", f8.6,"*i" )', z

contains

  subroutine assign_values()
    ! Local subroutine to assign values to arrays
    integer :: s
    integer,allocatable :: seed(:)
    real :: zr(20),zi(20),zzr,zzi
    ! ---- Start of RNG setup    
    ! Set up the seed
    call random_seed(size=s)
    allocate(seed(s))
    seed=1277345
    call random_seed(put=seed)
    ! Fill arrays a with random numbers
    ! in the interval [0,1[
    call random_number(a)
    call random_number(zr)
    call random_number(zi)
    z=cmplx(zr,zi)
    ! ---- End of RNG setup    
    c=['0123456789','abcdefghij','ABCDEFGHIJ','klmnopqrst']
    return
  end subroutine assign_values



end program ex4p4


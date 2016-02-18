program randomnumber
  implicit none
  integer, parameter :: n=1000
  integer :: narg,cnt
  real :: a,b
  character(len=80) :: arg
  real :: r(n)
  real :: l(n),u(n)
  logical :: mask(n)

  call generate_random(n,r)

  narg=command_argument_count()

  if (narg/=2) then
     print *, 'Need 2 arguments: arg(1) = lower limit and arg(2) = &
          &upper limit of the desired interval.'
     stop
  end if

  call get_command_argument(1,arg)
  read (arg,*) a
  call get_command_argument(2,arg)
  read (arg,*) b

  l=a
  u=b

  mask=r.ge.l.and.r.le.u

  cnt = count(mask)

  print "('Elements = ', i0)", n
  print "('Interval = [', f3.1, ',', f3.1']')", a,b
  print "('Count = ', i0)", cnt
  print "('% = ',f5.2)", (real(cnt)/n)*100

contains

  subroutine generate_random(n,r)
    implicit none
    integer, intent(in) :: n
    real, intent(out) :: r(n)
    integer :: nseed,dt(8)
    integer, allocatable :: seed(:)

    call random_seed(size=nseed)
    allocate(seed(nseed))

    call date_and_time(values=dt)

    seed=60*1000*dt(6)+1000*dt(7)+dt(8)

    call random_seed(put=seed)
    call random_number(r)

  end subroutine generate_random


end program randomnumber

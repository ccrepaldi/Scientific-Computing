program collatz_conjecture
  implicit none
  integer :: count=0
  integer(kind=8) :: n
  character(len=80) :: arg

  call get_command_argument(1,arg)
  read(arg,*) n

  do
     if (mod(n,2)==0) then
        n=n/2
     else
        if (mod(n,2)==1) then
           n=3*n+1
        end if
     end if
    ! write(*,*) n
     count=count+1
     if (count==10000) then
        print *, "Program exceeded 1e4 steps: last n-value was", n
        exit ! if the program takes more than 1e4 steps, the do-loop ends
     end if
     if (n==1) exit
     end do

  write(6,*) "Number of steps: ",count
end program collatz_conjecture

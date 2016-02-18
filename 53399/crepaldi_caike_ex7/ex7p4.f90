program test_collatz
  implicit none
  integer :: n

  n=27

  print *, collatz(n)

contains

  integer function collatz(n)
    implicit none
    integer :: count=0
    integer :: n
    character(len=80) :: arg
    do
       if (mod(n,2)==0) then
          n=n/2
       else
          if (mod(n,2)==1) then
             n=3*n+1
          end if
       end if
       count=count+1
       if (count==10000) then
          print *, trim('Collatz seq. exceeded 1e4 steps: last n-value was'), n
          exit ! if the program takes more than 1e4 steps, the do-loop ends
       end if
       if (n==1) exit
    end do
    collatz=count
  end function collatz

end program test_collatz

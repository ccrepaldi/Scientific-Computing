program tribonacci_test
  implicit none
  integer :: t, n ! tribonacci number (t) and index (n)

  read(5,*) n
  
  t = tribonacci(n)

  print "('The n=',i0,' tribonacci number is: ', i0)", n , t

contains

  recursive function tribonacci(n) result(f)
    integer, intent(in) :: n
    integer :: f

    if (n.LT.1) then
       print *, "The index n must be equal or greater than 1."
       f=0
    else if (n.GE.1.AND.n.LT.4) then
       f=1
    else
       f=tribonacci(n-1) + tribonacci(n-2) + tribonacci(n-3)
    end if

  end function tribonacci

end program tribonacci_test

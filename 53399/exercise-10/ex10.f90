module gcnmod
  implicit none
  integer, parameter :: p=-1 ! change p value here
  private :: p
  type :: gcn
     real :: x,y
  end type gcn
  interface operator(+)
     module procedure gcn_add
  end interface operator(+)
  interface operator(-)
     module procedure gcn_sub
  end interface operator(-)
  interface operator(*)
     module procedure gcn_mult
  end interface operator(*)
  interface operator(/)
     module procedure gcn_div
  end interface operator(/)
  interface assignment(=)
     module procedure real_from_gcn,gcn_from_real
  end interface assignment(=)
contains
  type(gcn) function gcn_add(z1,z2)
    implicit none
    type(gcn), intent(in) :: z1,z2

    gcn_add%x=z1%x+z2%x
    gcn_add%y=z1%y+z2%y

  end function gcn_add

  type(gcn) function gcn_sub(z1,z2)
    implicit none
    type(gcn), intent(in) :: z1,z2

    gcn_sub%x=z1%x-z2%x
    gcn_sub%y=z1%y-z2%y

  end function gcn_sub

  type(gcn) function gcn_mult(z1,z2)
    implicit none
    type(gcn), intent(in) :: z1,z2

    gcn_mult%x=z1%x*z2%x+p*z1%y*z2%y
    gcn_mult%y=z1%x*z2%y+z2%x*z1%y

  end function gcn_mult

  type(gcn) function gcn_div(z1,z2)
    implicit none
    type(gcn), intent(in) :: z1,z2
    real :: d

    d=1/(z2%x**2 - p*z2%y**2)

    gcn_div%x=d*(z1%x*z2%x-p*z1%y*z2%y)
    gcn_div%y=d*(z2%x*z1%y-z1%x*z2%y)

  end function gcn_div

  subroutine real_from_gcn(r,z)
    real, intent(out) :: r
    type(gcn), intent(in) :: z
    r=z%x
  end subroutine real_from_gcn

  subroutine gcn_from_real(z,r)
    type(gcn), intent(out) :: z
    real, intent(in) :: r
    z%x=r
    z%y=0
  end subroutine gcn_from_real
end module gcnmod

program test_gcn
  use gcnmod
  implicit none
  character(len=80) :: char
  real :: x
  type(gcn) :: z1,z2

  z1 = gcn(1.0,2.0) ! Generalized complex
  z2 = gcn(9.0,8.0) ! Generalized complex
  x = 5.0        ! Real

  call print_results()

contains

  subroutine print_results()

    print '(3a)', new_line(char), trim("Our variables:"), new_line(char)

    print "('+',48('-'),'+')"

    print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", trim('Z1 (GCN):'),&
         z1

    print "('|',48('-'),'|')"

    print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", &
         &trim('Z2 (GCN):'),z2

    print "('|',48('-'),'|')"

    print "('| ',a,T30,f0.2,T50,'|')", trim('X (REAL):'),&
         x
    print "('+',48('-'),'+')"

    print '(3a)', new_line(char), trim("Let's compare the results:"),&
         & new_line(char)

    print "('+',48('-'),'+')"
    print "('| ',a,T50,'|')", trim('ADDITION')

    print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", trim('GCN:'),&
         &z1+z2
    print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", &
         &trim('FORTRAN COMPLEX NUMBER:'),(1,2)+(9,8)

    print "('|',48('-'),'|')"
    print "('| ',a,T50,'|')", trim('SUBTRACTION')

    print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", trim('GCN:'),&
         &z1-z2
    print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", &
         &trim('FORTRAN COMPLEX NUMBER:'),(1,2)-(9,8)

    print "('|',48('-'),'|')"
    print "('| ',a,T50,'|')", trim('MULTIPLICATION')

    print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", trim('GCN:'),&
         &z1*z2
    print "('| ',a,T30,'(',f0.2,' + ',f0.2,'i)',T50,'|')", &
         &trim('FORTRAN COMPLEX NUMBER:'),(1,2)*(9,8)

    print "('|',48('-'),'|')"
    print "('| ',a,T50,'|')", trim('DIVISION')

    print "('| ',a,T30,'(',f5.2,' + ',f5.2,'i)',T50,'|')", trim('GCN:'),&
         &z1/z2
    print "('| ',a,T30,'(',f5.2,' + ',f5.2,'i)',T50,'|')", &
         &trim('FORTRAN COMPLEX NUMBER:'),(1,2)/(9,8)

    print "('+',48('-'),'+')"

    print '(3a)', new_line(char), trim("Assignment test:"), &
         &new_line(char)

    print "('+',48('-'),'+')"

    z1=x 

    print "('| ',a,T30,'(',f0.2,' + ',f5.2,'i)',T50,'|')", trim('(Z1 = X):'),&
         &z1

    x=z2

    print "('|',48('-'),'|')"

    print "('| ',a,T30,f0.2,T50,'|')", &
         &trim('(X = Z2):'),x

    print "('+',48('-'),'+')"

  end subroutine print_results
    

end program test_gcn


module lorentz
  use vfs ! for parameter values
  implicit none

  ! Contains the function cross, that evaluates the cross product
  ! between two 3-d vectors a and b, and the function florentz, that
  ! evaluates the lorentz force acting in a particle.

contains

  pure function cross(a,b) ! evaluates the cross product between 2 vectors
    real(rk),intent(in),dimension(3) :: a,b ! 3-d vectors
    real(rk) :: cross(3)

    cross=[(a(2)*b(3)-a(3)*b(2)),(a(3)*b(1)-a(1)*b(3)),(a(1)*b(2)-a(2)*b(1))]

  end function cross

  pure function florentz(q,E,B,v) ! calculates the lorentz force
    real(rk),intent(in) :: q
    real(rk),intent(in),dimension(3) :: E,B,v
    real(rk) :: florentz(3)
    ! uses the cross product function present in this module
    florentz=q*(E+cross(v,B))

  end function florentz

end module lorentz

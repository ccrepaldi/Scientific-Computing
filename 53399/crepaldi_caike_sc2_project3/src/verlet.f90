module verlet
  use vfs ! for parameter values
  use lorentz ! for the florentz function
  implicit none

  ! Contains the subroutine advance_step that evaluates
  ! the new acceleration, velocity and position of
  ! the particle using the verlet algorithm.

contains

  pure subroutine advance_step(E,B,q,m,a,v,x,dt) ! verlet algorithm
    real(rk),intent(in),dimension(3) :: E,B
    real(rk),intent(in) :: dt,q,m
    real(rk),intent(inout),dimension(3) :: x,v,a
    real(rk),dimension(3) :: x0,a0,v_n

    x0=x ! stores old position

    x=x+(v*dt)+(a*(dt**2)) ! calculates new position

    a0=a ! stores old acceleration
    v_n=(x-x0)/dt ! uses x in order to get a new temporary v (v_n) to calculate
                  ! the new acceleration using the lorentz force
    a=florentz(q,E,B,v_n)/m ! calculates new acceleration with v_n

    v=v+0.5_rk*(a0+a)*dt ! calculates new velocity using both the new a
                         ! and the old a (a0)

  end subroutine advance_step

end module verlet

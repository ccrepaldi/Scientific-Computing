program velocity_filter
  !
  ! Velocity Filter Simulation Program
  ! Scientific Computing II (Autumn 2015) Final project.
  ! Source code by Caike Crepaldi (caike.crepaldi@helsinki.fi).
  ! This program needs the vfs, lorentz and verlet modules.
  ! In those modules you can find the several subroutines, functions and
  ! parameters used in this simulation.
  !
  use vfs ! for help subroutine and parameters
  use lorentz ! for cross product function and lorentz force function
  use verlet ! for the verlet algorithm
  implicit none
  real(rk), dimension(3) :: E,B ! Eletric and magnetic field vectors (3-d vectors)
  real(rk), dimension(3) :: x,v,v_i,a ! position, velocity and acceleration of the current particle
  real(rk), dimension(3) :: L
  integer :: npart, n ! total number of particles and particle number (label)
  real(rk) :: dt ! time step
  real(rk) :: m, q ! mass and charge of the particle
  integer :: narg, p, count
  integer :: ios
  character(len=80) :: arg

  ! Filter parameters (box dimensions) in SI (meters)

  L=[1.9_rk,7.6_rk,1.9_rk]*1e-2 


  ! Read data from command line ********************************************

  narg=command_argument_count() ! number of command line arguments

  ! If the user calls the program without any command line argumments or with a
  ! narg different than 3, the program prints the help with detailed
  ! instructions. For more info, it is recomended to read the README files.
  if (narg/=3) then
     call print_help()
     stop
  end if

  call get_command_argument(1,arg)
  read(arg,*,iostat=ios) dt ! gets time step from command line
  if (ios/=0) then
     print '(a)', "Invalid command line argument (dt) type! Please use a real number!"
     stop
  end if

  call get_command_argument(2,arg)
  read(arg,*,iostat=ios) B(1) ! magnetic field strength (in the x-axis)
  if (ios/=0) then
     print '(a)', "Invalid command line argument (B) type! Please use a real number!"
     stop
  end if

  B(2:3)=0.0_rk

  ! Magnetic field is of the type: B = (B, 0, 0)

  call get_command_argument(3,arg)
  read(arg,*,iostat=ios) E(3) ! eletric field stregth (in the z-axis)
  if (ios/=0) then
     print '(a)', "Invalid command line argument (E) type! Please use a real number!"
     stop
  end if

  E(1:2)=0.0_rk

  write(6,*) "Problem Configuration:"
  write(6,'(/,a,x,3(f6.3))') trim('L [m] = '), L
  write(6,*) new_line(arg)
  write(6,*) trim('dt [s] = ')
  write(6,*) dt
  write(6,*) new_line(arg)
  write(6,*) trim('B [T] = ')
  write(6,*) B
  write(6,*) new_line(arg)
  write(6,*) trim('E [V/m] = ')
  write(6,*) E
  write(6,*) new_line(arg)

  ! Eletric field is of the type: E = (0, 0, E)

  ! Opens the input file and reads data ***********************************

  open(42,file='../run/input.dat',iostat=ios,action='read')
  if (ios/=0) then ! Houston, we have a problem!
     print '(a)',"Error reading the input.dat file."
     stop
  end if

  read(42,*), npart ! number of particles in the simulation

  ! Opens the output file in order to write the results *******************

  open(64,file='../run/output.dat',iostat=ios,action='write')
  if (ios/=0) then ! Houston, we have a problem!
     print '(a)',"Error writing the output.dat file."
     stop
  end if

  write(64,'(a)') "Output syntax:  n vx vy vz xx xy xz m q"

  ! Do the simulation ******************************************************

  count=0 ! counter of successful particles
  ! (particles that get to the other side of the filter)

  particle_loop: do p=1,npart

     ! particle init. (reads data from the p-th line of the input file)
     read(42,*,iostat=ios),n,v_i,m,q
     if (ios/=0) then ! Houston, we have a problem!
        print '(a)',"Error reading the configuration of a particle."
        print '(a)',"Incorrect type! Please use real number."
        stop
     end if

     q=q*ec ! q is now the particle charge in Coulumb (SI)

     m=abs(m*me) ! m is the particle mass in kg (SI) (mass must be non-negative)

     x=[L(1)/2.0_rk,0.0_rk,L(3)/2.0_rk] ! initial position (center)

     v=v_i ! initial velocity

     a=florentz(q,E,B,v)/m ! calculates the first acceleration

     simulation_loop:  do
        ! this is where the true simulation happens
        if ( ( abs(x(1)) >= L(1) ) .or. ( abs(x(3)) >= L(3) ) ) then
           write(6,'(a,x,i0,x,a)') "The particle", n, "hit the wall!"
           exit ! particle hits the wall of the filter
        else if (x(2)>=L(2)) then
           count=count+1 ! particle passes through the filter
           write(64,*) n,v,x,m,q
           write(64,*) new_line(arg)
           write(6,'(a,x,i0,x,a)') "The particle", n, "passed throught!"
           exit
        end if
        ! uses the verlet algorithm to update the values
        call advance_step(E,B,q,m,a,v,x,dt) 
     end do simulation_loop
  end do particle_loop

  write(64,'(i0)') count ! writes the numb. of successful particles

  ! Close files (input and output)

  close(42)
  close(64)


end program velocity_filter

module vfs
  implicit none
  integer,parameter :: rk=selected_real_kind(15,307)
  real(rk),parameter :: ec=1.6021766e-19 ! electron charge
  real(rk), parameter :: me=9.1093836e-31 ! electron mass

  ! Contains parameter values used in the simulation and the print_help
  ! subroutine that prints information about the program in the screen.

contains

  subroutine print_help() ! prints some information about the vfsim program
    implicit none
    character(len=25) :: fname

    call get_command_argument(0,fname)

    write(6,"('+',58('-'),'+')")
    write(6,"('|',x,a,t60,'|')") "Welcome to the velocity filter simulation program!"
    write(6,"('+',58('-'),'+')")
    write(6,'(2x,a)') "This program was written in Fortran 95/2003 by Caike Crepaldi."
    write(6,'(2x,a)') "The program is the student's final project in the Scientific Computing II course (Autumn 2015)."
    write(6,"(80('-'))")
    write(6,'(/,2x,a,/)') "The program simulates the motion of charged particles in a velocity selector or a Wien filter."
    write(6,'(2x,a)') "The program reads data using a input file named input.dat and arguments using the command line."
    write(6,'(2x,a)') "In the input file, write the following data using the same order as shown:"
    write(6,'(3x,a)') trim('First line: &
         &Total number of particles to be simulated.')
    write(6,'(3x,a)') trim('N-th line (n=2,3,...,npart+1):')
    write(6,'(4x,a)') trim('A number to indicate which particle is which.')
    write(6,'(4x,a)') trim('Components of initial velocities vx,vy and vz.')
    write(6,'(4x,a)') trim('Mass of the particle.')
    write(6,'(4x,a,/)') trim('Charge of the particle.')
    write(6,'(2x,a)') "When calling the program from the shell, use the following command line arguments and syntax:"
    write(6,'(4x,2a,/)') trim(fname), trim(' dt B E')
    write(6,'(2x,a)') "For more information, please read the README files or the project report."

  end subroutine print_help

end module vfs

module cmd_line

  implicit none
  integer,parameter :: rk=selected_real_kind(10,20)
  integer,parameter :: MAXBUF=200
  character(len=MAXBUF),private :: argu

contains

  ! 
  ! Define here functions 
  ! 
  ! cmd2real(i) 
  ! of type real(rk) that reads the ith command line
  ! argument, converts it to real(rk) and returns this value
  !

  real function cmd2real(i)
    implicit none
    integer, intent(in) :: i
    real(kind=rk) :: value, x
    integer :: stat

    call get_command_argument(i,argu)

    read(argu,*,iostat=stat) value

    if (stat/=0) then
       value=huge(x)
    end if
       cmd2real=value   
    

  end function cmd2real
  
  
  !
  ! cmd2int(i) 
  ! of type integer that reads the ith command line
  ! argument, converts it to integer and returns this value
  ! 
  ! Note that constant 'rk' and variable 'argu' can be used here. Use
  ! 'internal io' to do the conversion.
  !

  integer function cmd2int(i)
    implicit none
    integer, intent(in) :: i
    real(kind=rk) :: value
    integer :: stat, x

    call get_command_argument(i,argu)

    read(argu,*,iostat=stat) value

    if (stat/=0) then
       value=huge(x)
    end if
    
    cmd2int=int(value)

  end function cmd2int
  
end module cmd_line

program scan_str
  implicit none
  integer :: narg,i,set,pos
  character(len=80) :: arg
  character(len=1) :: digit

  narg=command_argument_count()
  
  call get_command_argument(1,arg)

  pos=scan(arg,'0123456789')

  digit=arg(pos:pos)

  write(6,'(3a,i0)') 'First digit: ', digit, ' Position: ', pos

end program scan_str
  

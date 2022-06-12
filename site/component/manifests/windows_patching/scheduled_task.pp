# A scheduled task to install Windows patches
class component::windows_patching::scheduled_task(
  Enum['absent','present']                            $ensure = 'present',
  String                                            $schedule = 'monthly',
  Array[String]                                         $days = ['tues'],
  Enum['first','second','third','fourth','fifth'] $occurrence = 'third',
  String                                               $time  = '02:00',
  Boolean                                           $enabled  = true,
  Boolean                                             $reboot = false,
){
  $command = 'Get-WindowsUpdate -Download -AcceptAll; Get-WindowsUpdate -Install -AcceptAll'
  if $reboot {
    $rebootArg = ' -AutoReboot'
  }
  else {
    $rebootArg = ' -IgnoreReboot'
  }
  scheduled_task { 'Windows Patching':
    ensure    => 'present',
    command   => "$::system32\\WindowsPowerShell\\v1.0\\powershell.exe",
    arguments => "${command}${reboot}",
    enabled   => "${$enabled}",
    trigger   => [{
      schedule        => $schedule,
      start_time      => $time,
      day_of_week     => $days,
      which_occurrence => $occurrence,
    }],
    require   => Package['PSWindowsUpdate'],
  }
}

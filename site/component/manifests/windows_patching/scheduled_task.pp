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
  $args = 'Get-WindowsUpdate -Install -Download -AcceptAll'
  if $reboot {
    $args += ' -AutoReboot'
  }
  else {
    $args += ' -IgnoreReboot'
  }
  scheduled_task { 'Windows Patching':
    ensure    => 'present',
    command   => "$::system32\\WindowsPowerShell\\v1.0\\powershell.exe",
    arguments => $args,
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

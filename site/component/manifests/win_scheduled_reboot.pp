# A scheduled task set to reboot a host regularly
class component::win_scheduled_reboot(
  Enum['absent','present'] $ensure = 'present',
  String                 $schedule = 'weekly',
  Array[String]              $days = ['mon'],
  String                    $time  = '04:00',
  Boolean                $enabled  = true,
){
    scheduled_task { 'Weekly Reboot': # Unique name for the scheduled task
    ensure    => $ensure,
    command   => "$::system32\\WindowsPowerShell\\v1.0\\powershell.exe",
    arguments => 'shutdown -r',
    enabled   => "${$enabled}",
    trigger   => [{
      schedule    => $schedule,      # Defines the trigger type; required.
      day_of_week => $days,       # Day of week, array of string of 3 letter week abbrevations (mon, tue, fri)
      start_time  => $time,       # Defines the time the task should run; required.
    }],
  }
}

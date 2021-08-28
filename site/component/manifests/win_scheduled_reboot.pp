# A scheduled task set to reboot a host regularly
class win_scheduled_reboot(){
    scheduled_task { 'Automatic Reboot': # Unique name for the scheduled task
    ensure    => 'present',
    command   => "$::system32\\WindowsPowerShell\\v1.0\\powershell.exe",
    arguments => 'shutdown -r',
    enabled   => 'false',           # This is the default, but including it is good practice. Flip to 'false' to disable the task.
    trigger   => [{
      schedule    => 'weekly',      # Defines the trigger type; required.
      day_of_week => ['mon'],       # Day of week, array of string of 3 letter week abbrevations (mon, tue, fri)
      start_time  => '04:00',       # Defines the time the task should run; required.
    }],
  }
}

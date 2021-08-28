# A general role for a Windows Server
class profile::windows_server(){
  scheduled_task { 'Automatic Reboot': # Unique name for the scheduled task
    ensure    => 'present',
    command   => "$::system32\\WindowsPowerShell\\v1.0\\powershell.exe",
    arguments => 'shutdown -r',
    enabled   => 'false',           # This is the default, but including it is good practice. Flip to 'false' to disable the task.
    trigger   => [{
      schedule   => 'weekly',        # Defines the trigger type; required.
      start_time => '04:00',       # Defines the time the task should run; required.
    }],
  }
}

# A general role for a Windows Server
class profile::windows_server(){
  include component::win_scheduled_reboot
}

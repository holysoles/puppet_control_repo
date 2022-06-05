# A class for general server state
class role::server(){
  if $facts['os']['family'] == 'Windows' {
    include profile::windows_server
    include profile::windows_base
  }

  if $facts['os']['family'] == 'Debian' {
    include profile::debian_server
  }

}

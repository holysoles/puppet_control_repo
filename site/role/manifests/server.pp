# A class for general server state
class role::server(){
  if $facts['os']['family'] == 'Windows' {
    include profile::windows_server
  }

  if $facts['os']['family'] == 'Debian' {
    include profile::debian_server
  }

}

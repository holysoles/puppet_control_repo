# A class for defining some general linux host config
class profile::linux_server(){
  # Time management with ntp
  class { 'ntp':
        servers => ['nist-time-server.eoni.com','nist1-lv.ustiming.org','ntp-nist.ldsbc.edu']
  }
}

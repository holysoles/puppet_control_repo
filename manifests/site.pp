node 'automaster.donut.lan'{
  include role::puppet_master
  include role::server
}

node 'plexserver.donut.lan'{}

node 'windesktop.donut.lan'{
  include profile::windows_server
}

node 'donutdc.donut.lan'{}

node 'winlaptop.donut.lan'{}

node 'default'{}

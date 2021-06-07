node 'automaster.donut.lan'{
  include role::puppet_master
  include role::server
}

node 'plexserver.donut.lan'{}

node 'windesktop.donut.lan'{}

node 'donutdc.donut.lan'{}

node 'winlaptop.donut.lan'{}

node 'default'{}

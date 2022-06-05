hiera_include('classes')

node 'automaster.donut.lan'{
  include role::puppet_master
  include role::server
}

node 'plexserver.donut.lan'{}

node 'windesktop.donut.lan'{
  include role::server
}

node 'donutdc.donut.lan'{
  include role::server
}

node 'winipam.donut.lan'{
  include role::server
}

node 'winlaptop.donut.lan'{}

node 'default'{}

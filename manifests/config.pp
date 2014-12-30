# Class: minecraft::config
# This class setups the config files.
#
# TO DO
# - make stuff version dependend
# - add whitelist and other config files:
#    - banned-ips.json
#    - banned-players.json
#    - ops.jsom
#    - usercache.json
#    - whitelist.json
#
class minecraft::config (

  $eula      = $minecraft::params::eula,
  $group     = $minecraft::params::group,
  $user      = $minecraft::params::user,
  $user_home = $minecraft::params::user_home,
  $version   = $minecraft::params::version,

	) inherits ::minecraft::params {

  include minecraft::params

  file { "${user_home}/${version}/eula.txt":
    content => template('minecraft/eula.txt.erb'),
    ensure  => present,
    group  => $group,
    owner  => $user,
    require => File["${user_home}/${version}"]
  }

  file { "${user_home}/${version}/server.properties":
    content => template('minecraft/server.properties.erb'),
    ensure  => present,
    group   => $group,
    owner   => $user,
    require => File["${user_home}/${version}"]
  }
}
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

  $user_home = $minecraft::params::user_home,
  $version   = $minecraft::params::version,

	){

  include minecraft::params

  file { "${user_home}/${version}/eula.txt":
    ensure  => present,
    content => template('minecraft/eula.txt.erb'),
    require => File["${user_home}/${version}"]
  }

    file { "${user_home}/${version}/server.properties":
    ensure  => present,
    content => template('minecraft/server.properties.erb'),
    require => File["${user_home}/${version}"]
  }
}
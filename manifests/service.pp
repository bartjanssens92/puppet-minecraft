# Class: minecraft::service
#
#
class minecraft::service (

  $user      = $::minecraft::params::user,
  $user_home = $::minecraft::params::user_home,
  $service   = $::minecraft::params::service,
  $version   = $::minecraft::params::version,

	) inherits ::minecraft::params {

  $packages = ['screen']

  package { $packages:
    ensure => present,
  }

  file { "/etc/init.d/minecraft-${version}":
    mode    => '0755',
    content => template('minecraft/init_script.erb'),
  }

  service { "minecraft-${version}":
    ensure  => $service,
    require => [
      Package["$packages"],
      File["/etc/init.d/minecraft-${version}"],
    ]
  }
	
}
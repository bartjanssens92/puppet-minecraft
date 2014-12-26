# Class: minecraft::service
#
#
class minecraft::service (

  $service = $::minecraft::params::service,
  $version = $::minecraft::params::version,

	) inherits ::minecraft::params {

  $packages = ['screen']

  package { $packages:
    ensure => present,
  }

  file { "/etc/init.d/minecraft-${version}":
    mode    => '0755',
    content => template('minecraft/init_script.erb'),
  }
	
}
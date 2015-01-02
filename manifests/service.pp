# Class: minecraft::service
# This class defines the minecraft init script and
# starts the minecraft service if $service = running.
#
define minecraft::service (

  $group        = 'minecraft',
  $java_version = 'java-1.7.0-openjdk',
  $service      = 'running',
  $service_name,
  $user         = 'minecraft',
  $user_home    = '/home/minecraft',
  $version      = '1.8.1',

	){

  file { "/etc/init.d/${service_name}":
    mode    => '0755',
    content => template('minecraft/init_script.erb'),
  }

  service { "${service_name}":
    ensure  => $service,
    require => [
      Package['screen'],
      File["/etc/init.d/${service_name}"],
      Package["$java_version"],
    ]
  }
	
}
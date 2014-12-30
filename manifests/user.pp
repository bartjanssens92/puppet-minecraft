# Class: minecraft::user
# This class setups the $user, $group and home dir.
#
class minecraft::user(

  $user      = $minecraft::params::user,
  $user_home = $minecraft::params::user_home,
  $group     = $minecraft::params::group,
  
	) inherits ::minecraft::params{

  file { $user_home:
    ensure  => directory,
    owner   => $user,
    group   => $group,
    require => User["${user}"],
  }

  group { $group:
    ensure => present,
  }

  user { $user:
    ensure  => present,
    home    => $user_home,
    groups  => $group,
    shell   => '/bin/bash',
    require => [
      Group[$group],
#      File[$user_home],
    ]
  }
}
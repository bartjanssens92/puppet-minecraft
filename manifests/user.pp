# Class: minecraft::user
# This class setups the $user, $group and home dir.
#
define minecraft::user(

  $group     = 'minecraft',
  $user      = 'minecraft',
  $user_home = '/home/minecraft',
  
	){

  if !defined(User["$user"]) {
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
}
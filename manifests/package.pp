# Class minecraft::package
# This class gets the .jar file for the minecraft server from the official website.
#
class minecraft::package (

  $base_url  = $minecraft::params::base_url,
  $version   = $minecraft::params::version,
  $user_home = $minecraft::params::user_home,

	) inherits ::minecraft::params {

  file { "${user_home}/${version}":
    ensure => directory,
  }

  package { 'wget':
    ensure => present,
  }

  exec { "download-minecarft-${version}" :
    command => "wget --no-check-certificate ${base_url}${version}/minecraft_server.${version}.jar",
    cwd     => "${user_home}/${version}",
    require => [File["${user_home}/${version}"], Package['wget']],
    path    => ['/usr/bin', '/usr/sbin', '/bin'],
    onlyif  => "test ! -f ${user_home}/${version}/minecraft_server.${version}.jar -o ! -d ${user_home}/${version}",
  }
}
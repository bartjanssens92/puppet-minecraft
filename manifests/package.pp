# Class minecraft::package
# This class gets the .jar file for the minecraft server from the official website.
# and gets the other packages, wget and screen.
#
define minecraft::package (

  $base_url  = 'https://s3.amazonaws.com/Minecraft.Download/versions/',
  $dir,
  $group     = 'minecraft',
  $user      = 'minecraft',
  $user_home = '/home/minecraft',
  $version   = '1.8.1',

	){

  $packages = ['screen','wget']

  file { "${user_home}/${dir}":
    ensure => directory,
    owner  => $user,
    group  => $group,
  }

  if !defined(Package['wget']) {
    package { 'wget':
      ensure => present,
    }
  }

  if !defined(Package['screen']) {
    package { 'screen':
      ensure => present,
    }
  }

  exec { "download-minecarft-${version} to ${dir}" :
    command => "wget --no-check-certificate ${base_url}${version}/minecraft_server.${version}.jar",
    cwd     => "${user_home}/${dir}",
    require => [File["${user_home}/${dir}"], Package['wget']],
    path    => ['/usr/bin', '/usr/sbin', '/bin'],
    onlyif  => "test ! -f ${user_home}/${dir}/minecraft_server.${version}.jar -o ! -d ${user_home}/${dir}",
  }
}
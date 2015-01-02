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
define minecraft::config (

  $allow_flight                  = false,
  $allow_nether                  = true,
  $announce_player_achievements  = true,
  $base_url                      = 'https://s3.amazonaws.com/Minecraft.Download/versions/',
  $dir,
  $cpu_count                     = '1',
  $difficulty                    = '1',
  $enable_command_block          = false,
  $enable_query                  = false,
  $enable_rcon                   = false,
  $eula                          = 'false',
  $force_gamemode                = false,
  $gamemode                      = '0',
  $generate_structures           = true,
  $generator_settings            = undef,
  $group                         = 'minecraft',
  $hardcore                      = false,
  $java_version                  = 'java-1.7.0-openjdk',
  $level_name                    = 'world',
  $level_seed                    = undef,
  $level_type                    = 'DEFAULT',
  $max_build_height              = '256',
  $max_heap                      = '2048',
  $max_players                   = '20',
  $max_tick_time                 = '60000',
  $max_world_size                = '29999984',
  $min_heap                      = '1024',
  $motd                          = 'A Minecraft Server',
  $network_compression_threshold = '256',
  $online_mode                   = true,
  $op_permission_level           = '4',
  $player_idle_timeout           = '0',
  $pvp                           = true,
  $resource_pack                 = undef,
  $resource_pack_hash            = undef,
  $server_ip                     = undef,
  $server_options                = 'nogui',
  $server_port                   = '25565',
  $service                       = 'running',
  $snooper_enabled               = true,
  $spawn_animals                 = true,
  $spawn_monsters                = true,
  $spawn_npcs                    = true,
  $use_native_transport          = true,
  $user                          = 'minecraft',
  $user_home                     = '/home/minecraft',
  $version                       = '1.8.1',
  $view_distance                 = '10',
  $white_list                    = false,

	){

  file { "${user_home}/${dir}/eula.txt":
    content => template('minecraft/eula.txt.erb'),
    ensure  => present,
    group  => $group,
    owner  => $user,
    require => File["${user_home}/${dir}"]
  }

  file { "${user_home}/${dir}/server.properties":
    content => template('minecraft/server.properties.erb'),
    ensure  => present,
    group   => $group,
    owner   => $user,
    require => File["${user_home}/${dir}"],
    replace => false,
    notify  => Service["minecraft-${version}"],
  }
}
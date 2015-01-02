# Parameters:
# All the usual parameters that can be found in the server.properties file with the only difference that the '-' are changed to '_'.
# Other not so usual parameters:
# - base_url:
#   This is the url that is used to download the minecraft_server.jar file.
# - eula:
#   This is the value in the eula.txt file, it is default set to 'false' as by changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).
# - group:
#   The group to run the minecraft server under.
#   Values: 'true','false'.
# - user:
#   The user to run the minecraft server under.
# - user_home:
#   The home directory for the user.
# - version:
#   The minecraft version to install.
# 
# Example uses:
# 
# The most simple usecase:
# As the port and the version need to be defined.
# 
# minecraft { 'minecraft-1.8.1':
#   server_port => '25565',
#   version     => '1.8.1',
# }
# 
# Usecase with different config parameters:
# 
# minecraft { 'minecraft-1.8.1-creative':
#   gamemode    => '1',
#   server_port => '25566',
#   version     => '1.8.1',
# }
# 
# Usecase with different user:
# 
# minecraft { 'minecraft-1.8.1':
#   group       => 'somegroup',
#   user        => 'someuser',
#   user_home   => '/opt/minecraft'
#   server_port => '256656',
#   version     => '1.8.1',
# }
#
define minecraft (
  $allow_flight                  = false,
  $allow_nether                  = true,
  $announce_player_achievements  = true,
  $base_url                      = 'https://s3.amazonaws.com/Minecraft.Download/versions/',
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
  $server_port,
  $service                       = 'running',
  $snooper_enabled               = true,
  $spawn_animals                 = true,
  $spawn_monsters                = true,
  $spawn_npcs                    = true,
  $use_native_transport          = true,
  $user                          = 'minecraft',
  $user_home                     = '/home/minecraft',
  $version,
  $view_distance                 = '10',
  $white_list                    = false,
  ){

  $service_name = $title

  minecraft::user { "minecraft-user-${version}-${user}":
    user      => $user,
    user_home => $user_home,
    group     => $group,
  }
  ->
  minecraft::package { "minecraft-package-${version}":
    base_url  => $base_url,
    group     => $group,
    user      => $user,
    user_home => $user_home,
    version   => $version,
  }
  ->
  minecraft::java { "minecraft-java-${version}-${java_version}":
    java_version => $java_version,
  }
  ->
  minecraft::config { "minecraft-config-${version}":
    allow_flight                  => $allow_flight,
    allow_nether                  => $allow_nether,
    announce_player_achievements  => $announce_player_achievements,
    base_url                      => $base_url,
    cpu_count                     => $cpu_count,
    difficulty                    => $difficulty,
    enable_command_block          => $enable_command_block,
    enable_query                  => $enable_query,
    enable_rcon                   => $enable_rcon,
    eula                          => $eula,
    force_gamemode                => $force_gamemode,
    gamemode                      => $gamemode,
    generate_structures           => $generate_structures,
    generator_settings            => $generator_settings,
    group                         => $group,
    hardcore                      => $hardcore,
    level_name                    => $level_name,
    level_seed                    => $level_seed,
    level_type                    => $level_type,
    max_build_height              => $max_build_height,
    max_heap                      => $max_heap,
    max_players                   => $max_players,
    max_tick_time                 => $max_tick_time,
    max_world_size                => $max_world_size,
    min_heap                      => $min_heap,
    motd                          => $motd,
    network_compression_threshold => $network_compression_threshold,
    online_mode                   => $online_mode,
    op_permission_level           => $op_permission_level,
    player_idle_timeout           => $player_idle_timeout,
    pvp                           => $pvp,
    resource_pack                 => $resource_pack,
    resource_pack_hash            => $resource_pack_hash,
    server_ip                     => $server_ip,
    server_options                => $server_options,
    server_port                   => $server_port,
    service                       => $service,
    snooper_enabled               => $snooper_enabled,
    spawn_animals                 => $spawn_animals,
    spawn_monsters                => $spawn_monsters,
    spawn_npcs                    => $spawn_npcs,
    use_native_transport          => $use_native_transport,
    user                          => $user,
    user_home                     => $user_home,
    version                       => $version,
    view_distance                 => $view_distance,
    white_list                    => $white_list,
  }
  ->
  minecraft::service { "minecraft-service-${version}":
    service      => $service,
    service_name => $service_name,
    user         => $user,
    user_home    => $user_home,
    version      => $version,
  }
}
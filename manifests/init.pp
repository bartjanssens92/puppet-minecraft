# Some examples there on how about to use this module
#
#

class minecraft (
  $allow_flight                  = $::minecraft::params::allow_flight,
  $allow_nether                  = $::minecraft::params::allow_nether,
  $announce_player_achievements  = $::minecraft::params::announce_player_achievements,
  $base_url                      = $::minecraft::params::base_url,
  $cpu_count                     = $::minecraft::params::cpu_count,
  $difficulty                    = $::minecraft::params::difficulty,
  $enable_command_block          = $::minecraft::params::enable_command_block,
  $enable_query                  = $::minecraft::params::enable_query,
  $enable_rcon                   = $::minecraft::params::enable_rcon,
  $eula                          = $::minecraft::params::eula,
  $force_gamemode                = $::minecraft::params::force_gamemode,
  $gamemode                      = $::minecraft::params::gamemode,
  $generate_structures           = $::minecraft::params::generate_structures,
  $generator_settings            = $::minecraft::params::generator_settings,
  $group                         = $::minecraft::params::group,
  $hardcore                      = $::minecraft::params::hardcore,
  $java_version                  = $::minecraft::params::java_version,
  $level_name                    = $::minecraft::params::level_name,
  $level_seed                    = $::minecraft::params::level_seed,
  $level_type                    = $::minecraft::params::level_type,
  $max_build_height              = $::minecraft::params::max_build_height,
  $max_heap                      = $::minecraft::params::max_heap,
  $max_players                   = $::minecraft::params::max_players,
  $max_tick_time                 = $::minecraft::params::max_tick_time,
  $max_world_size                = $::minecraft::params::max_world_size,
  $min_heap                      = $::minecraft::params::min_heap,
  $motd                          = $::minecraft::params::motd,
  $network_compression_threshold = $::minecraft::params::network_compression_threshold,
  $online_mode                   = $::minecraft::params::online_mode,
  $op_permission_level           = $::minecraft::params::op_permission_level,
  $player_idle_timeout           = $::minecraft::params::player_idle_timeout,
  $pvp                           = $::minecraft::params::pvp,
  $resource_pack                 = $::minecraft::params::resource_pack,
  $resource_pack_hash            = $::minecraft::params::resource_pack_hash,
  $server_ip                     = $::minecraft::params::server_ip,
  $server_options                = $::minecraft::params::server_options,
  $server_port                   = $::minecraft::params::server_port,
  $service                       = $::minecraft::params::service,
  $snooper_enabled               = $::minecraft::params::snooper_enabled,
  $spawn_animals                 = $::minecraft::params::spawn_animals,
  $spawn_monsters                = $::minecraft::params::spawn_monsters,
  $spawn_npcs                    = $::minecraft::params::spawn_npcs,
  $use_native_transport          = $::minecraft::params::use_native_transport,
  $user                          = $::minecraft::params::user,
  $user_home                     = $::minecraft::params::user_home,
  $version                       = $::minecraft::params::version,
  $view_distance                 = $::minecraft::params::view_distance,
  $white_list                    = $::minecraft::params::white_list,
  ) inherits ::minecraft::params {

  class { 'minecraft::user':
    user      => $user,
    user_home => $user_home,
    group     => $group,
  }
  ->
  class { 'minecraft::package':
    base_url  => $minecraft::params::base_url,
    group     => $group,
    user      => $user,
    user_home => $user_home,
    version   => $version,
  }
  ->
  class { 'minecraft::java':
    java_version => $java_version,
  }
  ->
  class { 'minecraft::config':
    eula      => $eula,
    group     => $group,
    user      => $user,
    user_home => $user_home,
    version   => $version,
  }
  ->
  class { 'minecraft::service':
    user      => $user,
    user_home => $user_home,
    service   => $service,
    version   => $version,
  }
}
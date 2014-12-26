# Class minecraft::java
# This class setups the java version for minecraft to use.
#
class minecraft::java (

  $java_version = $minecraft::params::java_version,

	) inherits ::minecraft::params {

	include minecraft::params

	package { $java_version:
      ensure => present,
	}
}
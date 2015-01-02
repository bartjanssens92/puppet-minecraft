# Class minecraft::java
# This class setups the java version for minecraft to use.
#
define minecraft::java (
  
  $java_version = 'java-1.7.0-openjdk',

	){

  if !defined(Package["$java_version"]) {
  	package { $java_version:
        ensure => present,
  	}
  }
}
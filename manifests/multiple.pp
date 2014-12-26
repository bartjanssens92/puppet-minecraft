#
#
#
define minecraft::multiple (

  ){
    class { 'minecraft':
      version => $version,
    }
  }
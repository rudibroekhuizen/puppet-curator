# == Class curator::install
#
class curator::install {

  Install Pip
  package { python-pip:
    ensure => present,
  }

  # Install Curator
  package { curator:
    ensure   => $curator::version,
    provider => pip,
    require  => Package['python-pip'],
  }
  
}

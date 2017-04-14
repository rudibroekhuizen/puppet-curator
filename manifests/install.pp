# == Class curator::install
#
class curator::install {

  # Install Pip
  package { 'python-pip':
    ensure => present,
  }

  # Install Curator
  package { 'elasticsearch-curator':
    ensure   => $curator::version,
    provider => pip,
    require  => Package['python-pip'],
  }

  # Create .curator directory for curator yaml files
  file { '/root/.curator':
    ensure => 'directory',
  }

}

# == Class: curator::actions
#
class curator::actions {

  file { '/root/.curator':
    ensure => 'directory',
  }

  # Configure actions.yml file using https://github.com/cataphract/puppet-yaml_settings module
  yaml_settings { '/root/.curator/actions.yml':
    values => $curator::actions_yml,
  }
  
  # Schedule curator
  cron { "curator_run":
    ensure  => 'present',
    command => '/usr/local/bin/curator --config /root/.curator/curator.yml /root/.curator/actions.yml >/dev/null',
    hour    => 1,
    minute  => 10,
    weekday => '*',
  }
  
}

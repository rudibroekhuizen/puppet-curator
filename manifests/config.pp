# == Class: curator::config
#
class curator::config {

  # Configure curator.yml
  yaml_settings { '/.root/.curator/curator.yml':
    values  => $curator::curator_yml,
  }

}

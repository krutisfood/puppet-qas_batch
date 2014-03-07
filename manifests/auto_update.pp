# Manages auto-update script
class qas_batch::auto_update inherits qas_batch {
  require qas_batch::install

  $_install_dir           = $qas_batch::_install_dir
  $_update_dataset_command = "/usr/bin/env python ${_install_dir}/updater/metadatawebapi.py"
  $_updater_file           = "${_install_dir}/updater/metadatawebapi.py"

  file {
    "${_install_dir}/updater":
      ensure => 'directory';

    $_updater_file:
      ensure  => $qas_batch::_ensure,
      content => template('qas_batch/updater/metadatawebapi.py.erb');
  }

  notify { "Name for requests lib ${qas_batch::python_requests_name}":
    message => "${qas_batch::python_requests_provider}"
  }

  package { $qas_batch::params::python_requests_name:
    ensure   => 'present',
    provider => $qas_batch::params::python_requests_provider
  }

  # Trigger a data update to ensure initial data population
  exec { 'Download Initial QAS Batch Dataset':
    command => $_update_dataset_command,
    require => [Package['requests']],
    creates => "${_install_dir}/data/dummy"
  }

  # Cron update
  cron {  'Update QAS Data':
    command => $_update_dataset_command,
    hour    => 15,
    minute  => 0;
  }
}

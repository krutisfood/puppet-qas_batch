# Manages auto-update script
class qas_batch::auto_update inherits qas_batch {
  $_install_dir           = $qas_batch::install_dir
  $_update_dataset_command = "/usr/bin/env python ${_install_dir}/updater/metadatawebapi.py"
  $_updater_file           = "${_install_dir}/updater/metadatawebapi.py"

  file {
    "${_install_dir}/updater":
      ensure => 'directory';

    $_updater_file:
      ensure  => $qas_batch::_ensure,
      content => template('qas_batch/updater/metadatawebapi.py.erb');
  }

  package { 'requests':
    ensure   => 'present',
    provider => 'pip'
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

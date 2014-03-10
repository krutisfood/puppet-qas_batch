# Manages auto-update script
class qas_batch::auto_update inherits qas_batch {
  $_install_dir           = $qas_batch::_install_dir
  $_update_dataset_command = "cd ${qas_batch::_dataset_dir}; /usr/bin/env python ${_install_dir}/updater/metadatawebapi.py"
  $_updater_file           = "${_install_dir}/updater/metadatawebapi.py"
  $cron = $qas_batch::_auto_update ? {
    /true|'true'/ => 'present',
    default       => 'absent'
  }

  file {
    $qas_batch::_dataset_dir:
      ensure => 'directory';
  }

  file {
    "${_install_dir}/updater":
      ensure => 'directory';

    $_updater_file:
      ensure  => $qas_batch::_ensure,
      content => template('qas_batch/updater/metadatawebapi.py.erb');
  }

  notify { "Name for requests lib ${qas_batch::python_requests_name}":
    message => $qas_batch::python_requests_provider
  }

  package { $qas_batch::params::python_requests_name:
    ensure   => 'present',
    provider => $qas_batch::params::python_requests_provider
  }

  # Trigger a data update to ensure initial data population
  if $qas_batch::_auto_update {
    exec { 'Download Initial QAS Batch Dataset':
      command => $_update_dataset_command,
      creates => "${qas_batch::_dataset_dir}/${qas_batch::_installed_data}",
      require => [Package[$qas_batch::params::python_requests_name]],
    }
  }

  # Cron update
  cron {  'Update QAS Data':
    ensure  => $cron,
    command => $_update_dataset_command,
    hour    => 15,
    minute  => 0;
  }
}

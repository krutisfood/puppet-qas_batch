# Manages auto-update script
class qas_batch::auto_update() inherits qas_batch {
  file {
    "${qas_batch::install_dir}/updater":
      ensure => 'directory';

    "${qas_batch::install_dir}/updater/metadatawebapi.py":
      ensure  => 'present',
      content => 'puppet:///modules/qas_batch/metadatawebapi.py';
  }

  # Trigger an update after the file is replaced

  # Cron update
  cron {  'Update QAS Data':
    command => "/usr/bin/env python ${qas_batch::install_dir}/updater/metadatawebapi.py",
    hour    => 15,
    minute  => 0;
  }
}

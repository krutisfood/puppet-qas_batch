# Class installing and configuring QAS Batch
class qas_batch (
  $ensure               = 'UNSET',
  $licenses             = 'UNSET',
  $qas_updater_username = 'UNSET',
  $qas_updater_password = 'UNSET'
) {
  include qas_batch::params
  $_install_dir = $::qas_batch::params::install_dir

  $_ensure = $ensure ? {
    'UNSET' => $::qas_batch::params::ensure,
    default => $ensure,
  }

  include qas_batch::install
  include qas_batch::config
  include qas_batch::auto_update
}

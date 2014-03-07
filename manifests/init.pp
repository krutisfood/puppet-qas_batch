# Class installing and configuring QAS Batch
class qas_batch (
  $ensure                = 'UNSET',
  $licenses              = 'UNSET',
  $qas_updater_username  = 'UNSET',
  $qas_updater_password  = 'UNSET',
  $qaworld_template_file = 'UNSET',
  $data_dir              = 'UNSET',
  $data_mappings         = 'UNSET'
) {
  include qas_batch::params
  $_install_dir = $::qas_batch::params::install_dir

  $_ensure = $ensure ? {
    'UNSET' => $::qas_batch::params::ensure,
    default => $ensure,
  }

  $_data_dir = $data_dir ? {
    'UNSET' => $::qas_batch::params::data_dir,
    default => $data_dir,
  }

  $_data_mappings = $data_mappings ? {
    'UNSET' => $::qas_batch::params::data_mappings,
    default => $data_mappings,
  }

  include qas_batch::install
  include qas_batch::config
  include qas_batch::auto_update
}

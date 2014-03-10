# = Class: QAS Batch
#
# This is the main QAS Batch class
#
#
# == Parameters
#
# Module specific parameters
#
# [*ensure*]
#   Defines whether qas_batch should be installed or removed.
#   Default: present
#
# [*licenses*]
#   Licenses to apply to this install of QAS Batch.
#   REQUIRED.
#
# [*auto_update*]
#   Sets a cron job to run to auto update the QAS datasets.
#   Will attempt to install PIP and Python Requests library.
#
# [*updater_username*]
#   Username for auto-update authentication against the
#   Experian QAS REST api.
#
# [*updater_password*]
#   Password for auto-update authentication against the
#   Experian QAS REST api.
#
# [*qaworld_template_file*]
#   Template to be used for the qaworld.ini file,
#   used by QAS to determine output formatting.
#
# [*installed_data*]
#   The datasets installed. Default: AUS
#
# [*data_mappings*]
#   The QAS data mappings string. Default: AUS,Australia,AUS.
#
# [*dataset_dir*]
#   Directory containing any datasets. Default: /opt/qas/downloads
#
# == Examples
#
# See README for details.
#
class qas_batch (
  $ensure                = 'UNSET',
  $licenses              = 'UNSET',
  $auto_update           = 'UNSET',
  $updater_username      = 'UNSET',
  $updater_password      = 'UNSET',
  $qaworld_template_file = 'UNSET',
  $installed_data        = 'UNSET',
  $data_mappings         = 'UNSET',
  $dataset_dir           = 'UNSET'
) {
  include qas_batch::params
  $_install_dir = $::qas_batch::params::install_dir
  $_dataset_link = "${_install_dir}/data"

  $_ensure = $ensure ? {
    'UNSET' => $::qas_batch::params::ensure,
    default => $ensure,
  }

  $_installed_data = $installed_data ? {
    'UNSET' => $::qas_batch::params::installed_data,
    default => $installed_data,
  }

  $_data_mappings = $data_mappings ? {
    'UNSET' => $::qas_batch::params::data_mappings,
    default => $data_mappings,
  }

  $_dataset_dir = $dataset_dir ? {
    'UNSET' => $::qas_batch::params::dataset_dir,
    default => $dataset_dir,
  }

  $_auto_update = $auto_update ? {
    'UNSET' => $::qas_batch::params::auto_update,
    default => $auto_update,
  }

  class { 'qas_batch::install': } ->
  class { 'qas_batch::auto_update': } ->
  class { 'qas_batch::config': }
}

# Parameters for cross platform support
class qas_batch::params {
  $ensure                   = 'present'
  $install_dir              = '/opt/qas'
  $installed_data           = "AUS,${install_dir}/data"
  $data_mappings            = 'AUS,Australia,AUS'
  $python_requests_name     = $::osfamily ? {
    'Suse'  => 'python-requests',
    default => 'requests'
  }
  $python_requests_provider = $::osfamily ? {
    'Suse'  => 'zypper',
    default => 'pip'
  }
}

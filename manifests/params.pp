# Parameters for cross platform support
class qas_batch::params {
  $ensure        = 'present'
  $install_dir   = '/opt/qas'
  $data_dir      = "${install_dir}/data"
  $data_mappings = 'AUS,Australia,AUS'
}

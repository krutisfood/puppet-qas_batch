# Configures qas batch
class qas_batch::config inherits qas_batch {
  file {
    "${::install_dir}/data":
      ensure => 'directory';
  }

  file {
    "${::install_dir}/qalicn.ini":
      ensure  => 'present',
      content => template('modules/qas_batch/qalicn.ini.erb');
  }

#  file { 'country.ini':
#    ensure  => 'present',
#    content => template('')
#  }
}

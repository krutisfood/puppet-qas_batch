# Configures qas batch
class qas_batch::config inherits qas_batch {
  file {
    "${::install_dir}/data":
      ensure => 'directory';
  }

  file {
    "${::install_dir}/bin/qalicn.ini":
      ensure  => 'present',
      content => template('qas_batch/qalicn.ini.erb');
  }

#  file { 'country.ini':
#    ensure  => 'present',
#    content => template('')
#  }
}

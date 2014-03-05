# Configures qas batch
class qas_batch::config inherits qas_batch {
  require qas_batch::install
  file {
    "${install_dir}/data":
      ensure => 'directory';
  }

  file {
    "${install_dir}/bin/qalicn.ini":
      ensure  => 'present',
      content => template('qas_batch/qalicn.ini.erb'),
      require => File["${install_dir}/data"];
  }

#  file { 'country.ini':
#    ensure  => 'present',
#    content => template('')
#  }
}

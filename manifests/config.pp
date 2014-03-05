# Configures qas batch
class qas_batch::config inherits qas_batch {
  file {
    "${qas_batch::install_dir}/data":
      ensure => 'directory';
  }

  file {
    "${qas_batch::install_dir}/bin/qalicn.ini":
      ensure  => 'present',
      content => template('qas_batch/qalicn.ini.erb'),
      require => File["${qas_batch::install_dir}/data"];
  }

#  file { 'country.ini':
#    ensure  => 'present',
#    content => template('')
#  }
}

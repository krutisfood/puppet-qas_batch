# Configures qas batch
class qas_batch::config inherits qas_batch {
  require qas_batch::install
  $_install_dir = $qas_batch::_install_dir
  file {
    "${_install_dir}/bin/batwv":
      mode => '0755';
  }

  file {
    "${_install_dir}/data":
      ensure => 'directory';
  }

  file {
    "${_install_dir}/bin/qalicn.ini":
      ensure  => 'present',
      content => template('qas_batch/qalicn.ini.erb'),
      require => File["${_install_dir}/data"];
  }

#  file { 'country.ini':
#    ensure  => 'present',
#    content => template('')
#  }
}

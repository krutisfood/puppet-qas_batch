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
    "${_install_dir}/bin/qaworld.ini":
      ensure  => $qas_batch::_ensure,
      content => template($qas_batch::qaworld_template_file);
  }

  file {
    "${_install_dir}/bin/qalicn.ini":
      ensure  => $qas_batch::_ensure,
      content => template('qas_batch/qalicn.ini.erb');
  }

  file {
    "${_install_dir}/bin/qawserve.ini":
      ensure  => $qas_batch::_ensure,
      content => template('qas_batch/qawserve.ini.erb');
  }

#  file { 'country.ini':
#    ensure  => 'present',
#    content => template('')
#  }
}

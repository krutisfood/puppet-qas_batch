# Configures qas batch
class qas_batch::config inherits qas_batch {
  $_install_dir = $qas_batch::_install_dir
  file {
    ["${_install_dir}/bin/batwv","${_install_dir}/bin/batwv.sh"]:
      mode => '0555';
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

  $latest_dataset_command = "ls -t -d -1 ${qas_batch::_dataset_dir}/${qas_batch::_installed_data}/*|/usr/bin/env head -1"
  exec {
    'Set latest qas dataset link':
      command => "/usr/bin/env ln -n -f -s `${latest_dataset_command}` ${qas_batch::_dataset_link}",
      onlyif  => "/usr/bin/env test `${latest_dataset_command}` = `readlink ${qas_batch::_dataset_link}`; echo $?",
  }
}

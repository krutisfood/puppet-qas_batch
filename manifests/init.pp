# Class installing and configuring QAS Batch
class qas_batch(
  $ensure = 'UNSET'
) {
  include qas_batch::params

  $ensure_real = $ensure ? {
    'UNSET' => $::qas_batch::params::ensure,
    default => $ensure,
  }

  class { 'qas_batch::install':
    ensure => $ensure_real
  }
  include qas_batch::config
  include qas_batch::auto_update
}

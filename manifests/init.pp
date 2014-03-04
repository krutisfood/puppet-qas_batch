# Class installing and configuring QAS Batch
class qas_batch(
  $ensure = 'UNSET'
) {
  include qas_batch::params

  $ensure_real = $ensure ? {
    'UNSET' => $::qas_batch::params::ensure,
    default => $ensure,
  }

  include qas_batch::install
  include qas_batch::config
  include qas_batch::auto_update
}

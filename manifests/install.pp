# Installs QAS Batch
class qas_batch::install inherits qas_batch {
  package { 'qas-batch':
    ensure => $_ensure
  }
}

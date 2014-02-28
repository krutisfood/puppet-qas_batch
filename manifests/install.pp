# Installs QAS Batch
class qas_batch::install {
  package { 'qas-batch':
    ensure => present
  } 
}

# Puppet module: QAS Batch

This is a Puppet module for QAS batch.

Made by krutisfood / nib

Official site: http://www.qas-experian.com.au/

Official git repository: http://github.com/krutisfood/puppet-qas-batch

Released under the terms of Apache 2 License.

## USAGE - Basic management

* Install QAS Batch with default settings

        class { 'qas-batch': }

* Remove puppet package

        class { 'qas-batch':
          ensure => 'absent'
        }


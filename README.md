# Puppet module: QAS Batch

This is a Puppet module for QAS batch.

Made by krutisfood / nib

Official site: http://www.qas-experian.com.au/

Official git repository: http://github.com/krutisfood/puppet-qas-batch

Released under the terms of Apache 2 License.

## USAGE - Basic management

* Install QAS Batch with default settings

        class { 'qas-batch': 
            $licenses             => ['my_lic1'],
            $qas_dataset_dir      => '/opt/qas/data',
            $qaworld_file         => 'profile/qas/qaworld.ini.erb' 
        }

* Install QAS with auto updater enabled
_WARNING:_ The auto updater will download datasets though does not point the configuration at it.

        class { 'qas-batch': 
            $licenses             => ['my_lic1'],
            $qas_updater_username => 'my username',
            $qas_updater_password => 'not my real password',
            $qaworld_file         => 'profile/qas/qaworld.ini.erb' 
        }
 
* Remove puppet package

        class { 'qas-batch':
            ensure => 'absent'
        }


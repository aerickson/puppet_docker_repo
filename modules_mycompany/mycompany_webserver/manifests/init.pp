# == Class: mycompany_webserver
#
# classes to run for the webserver role
# class parameters can be coded here or resolved via the hiera parameter hierachy
#
class mycompany_webserver
{

    package { 'zstd':
        ensure => installed,
    }

    package { 'python3-pip':
        ensure => installed,
    }

    package { 'python-pip':
        ensure => installed,
    }

    # BUG: on Puppet < 5, naming collision issue:
    #  https://projects.puppetlabs.com/issues/1398
    #  - can't use package to install zstandard for pip and pip3

    # BUG: on Puppet < 6, this requires two runs to install
    # https://tickets.puppetlabs.com/browse/PUP-7644
    package { 'zstandard-py2':
        ensure   => '0.11.1',
        name     => 'zstandard',
        provider => 'pip',
        require  => Package['python-pip'],
    }

    package { 'zstandard-py3':
        ensure   => '0.11.1',
        name     => 'zstandard',
        provider => 'pip3',
        require  => Package['python3-pip'],
    }
    
}

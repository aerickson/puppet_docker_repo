# == Class: mycompany_webserver
#
# classes to run for the webserver role
# class parameters can be coded here or resolved via the hiera parameter hierachy
#
class mycompany_webserver
{

	package { ['zstd']:
	  ensure => installed,
	}

 	package { ['python3-pip']:
      ensure => installed,
 	}

	package { ['python-pip']:
	  ensure => installed,
	}

	# to run pip/pip3 need to run:
    #   export LC_ALL=C

	package { 'zstandard@2':
	  name => 'zstandard',
	  ensure   => '0.11.1',
	  provider => 'pip',
	  require  => Package['python-pip'],
	}

	# BUG: on Puppet < 6, this requires two runs to install 
	# https://tickets.puppetlabs.com/browse/PUP-7644
	package { 'zstandard@3':
	  name     => 'zstandard',
	  ensure   => '0.11.1',
	  provider => 'pip3',
	  require  => Package['python3-pip'],
	}

}

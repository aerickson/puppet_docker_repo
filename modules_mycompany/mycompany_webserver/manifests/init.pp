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

	# call apache class
 	# class { 'apache': }

 	package { ['python3-pip']:
      ensure => installed,
 	}

	package { ['python-pip']:
	  ensure => installed,
	}

	# package { 'pip':
	#   require  => Package['python-pip'],
	#   ensure   => latest,
	#   provider => 'pip',
	# }

	# package { ['python-devel', 'openssl-devel', 'libffi-devel']:
	#   ensure => installed,
	# }

	# need 
	#
    # export LC_ALL=C

	# https://ask.puppet.com/question/25819/how-to-install-pip-packages/
	# https://puppet.com/docs/puppet/latest/types/package.html#package-provider-pip3

	# package { 'zstandard':
	#   ensure   => '0.11.1',
	#   # require  => Package['python-pip', 'python-devel', 'openssl-devel', 'libffi-devel'],
	#   package => pip3
	# }

	package { 'zstandard@2':
	  name => 'zstandard',
	  ensure   => '0.11.1',
	  provider => 'pip',
	  # require  => Package['python-pip', 'python-devel', 'openssl-devel', 'libffi-devel'],
	}


	# BUG: https://stackoverflow.com/questions/44439763/puppet-installing-pip-rather-than-pip3-packages-using-the-pip3-provider-only-on
	# - https://tickets.puppetlabs.com/browse/PUP-7644
	#   - requires two runs to install... switch to exec?
	package { 'zstandard@3':
	  ensure   => installed,
	  name     => 'zstandard~=0.11.1',
	  provider => 'pip3',
	  # require  => Package['pip', 'python-devel', 'openssl-devel', 'libffi-devel'],
	}


}

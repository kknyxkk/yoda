class base {
	case $::osfamily{
		"redhat": {
			$pacotes = ["fish","epel-release","git","vim","sysstat","htop","sl","figlet","httpd"]
			
			service{'httpd':
				ensure => running,
				enable => true
			}
		}	
		"debian": {
			$pacotes = ["fish","git","vim","sysstat","htop","cowsay","sl","figlet","apache2"]
			exec{"Atualiza repos":
				command => "/usr/bin/apt update"
			}

			service{'apache2':
				ensure => running,
				enable => true
			}
			
		}	
	}

	package{$pacotes:
		ensure => present
	}

	file{'/root/.bashrc':
		source => "puppet:///modules/base/bashrc_base",
		ensure => present
	}

	user{'devops':
		ensure => present,
		managehome => yes,
		shell => "/usr/bin/fish"
	}

	user{'root':
		ensure => present,
		shell => "/usr/bin/fish"
		
	}
}

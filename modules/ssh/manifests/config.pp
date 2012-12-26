class ssh::config{
	File {
		require	=>	Class["ssh::install"],
		notify	=>	Class["ssh::service"],
		ensure	=>	present,
		owner	=>	'root',
		group	=>	'root',
		mode	=>	0600,
	}
	file { $ssh::params::ssh_service_config:
		source	=>	"puppet://$puppetserver/modules/ssh/sshd_config",
		}
	}


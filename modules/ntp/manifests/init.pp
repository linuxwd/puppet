class ntp {
	package {'ntp':
		ensure		=> 'installed',
		}

	file {'/etc/ntp.conf':
		mode		=> 640,
		owner		=> root,
		group		=> root,
		source		=> "puppet://$puppetserver/modules/ntp/ntp.conf",
		require		=> Package['ntp'],
		}

	service {"ntpd":
		ensure		=> running,
		enable		=> true,
		pattern		=> 'ntpd',
		}	
	}

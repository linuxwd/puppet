class ntp::config {
	File {
		require		=> Class['ntp::install'],
		notify		=> Class['ntp::service'],
		mode		=> 640,
		owner		=> root,
		group		=> root,
	}
	file {'/etc/ntp.conf':
		source		=> "puppet://$puppetserver/modules/ntp/ntp.conf",
	}
}

class apache-ant::prepare {
	file { "/tmp/apache-ant-1.8.4-bin.tar.gz":
		owner		=> root,
		group		=> root,
		mode		=> 644,
		source		=> "puppet://$puppetserver/modules/apache-ant/apache-ant-1.8.4-bin.tar.gz",
		recurse		=> true,
		notify		=> Class['apache-ant::install']
	}
}

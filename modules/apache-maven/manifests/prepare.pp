class apache-maven::prepare {
	file { "/tmp/apache-maven-3.0.4-bin.tar.gz":
		owner		=> root,
		group		=> root,
		mode		=> 644,
		source		=> "puppet://$puppetserver/modules/apache-maven/apache-maven-3.0.4-bin.tar.gz",
		recurse		=> true,
		notify		=> Class['apache-maven::install']
	}
}

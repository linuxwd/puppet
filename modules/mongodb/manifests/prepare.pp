class mongodb::prepare {
	file { "/tmp/mongodb-linux-x86_64-2.2.2.tgz":
		owner		=> root,
		group		=> root,
		mode		=> 644,
		source		=> "puppet://$puppetserver/modules/mongodb/mongodb-linux-x86_64-2.2.2.tgz",
		recurse		=> true,
		notify		=> Class['mongodb::install']
	}
}

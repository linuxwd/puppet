class sun-jdk::prepare {
	file { "/tmp/jdk-6u38-linux-x64-rpm.bin":
		owner		=> root,
		group		=> root,
		mode		=> 755,
		source		=> "puppet://$puppetserver/modules/sun-jdk/jdk-6u38-linux-x64-rpm.bin",
		recurse		=> true,
		notify		=> Class['sun-jdk::install']
	}
}

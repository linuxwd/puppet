class mongodb::config {
	File {
		owner		=> "root",
		group		=> "root",
		require		=> Class['mongodb::install'],
	}
	file { "/etc/profile.d/mongodb.sh":
		owner		=> root,
		group		=> root,
		mode		=> 644,
		ensure		=> present,
		source		=> "puppet://$puppetserver/modules/mongodb/etc/profile.d/mongodb.sh",
#		name		=> "/tmp/profile",
#		content		=> template("jdk/profile.erb"),
		require		=> Class["mongodb::install"],
		before		=> Exec["update-mongodb-profile"],
		notify		=> Exec["update-mongodb-profile"],
	}
	exec { "update-mongodb-profile":
		cwd		=> "/etc",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin/","/usr/lcoal/sbin/"],
		command		=> 'echo ". /etc/profile"| bash', #此命令貌似不好用，先加上吧
		require		=> File["/etc/profile.d/mongodb.sh"],
		refreshonly	=> true,	#避免重复执行追加动作.如果是cat命令.效果将是很明显的.
		notify		=> File["/etc/init.d/mongodb"],
	}
	file { "/etc/init.d/mongodb":
		owner		=> root,
		group		=> root,
		mode		=> 755,
		ensure		=> present,
		source		=> "puppet://$puppetserver/modules/mongodb/etc/init.d/mongodb",
		require		=> Exec["update-mongodb-profile"],
		notify		=> Exec["add-mongodb-service"],
	}
	exec { "add-mongodb-service":
		cwd		=> "/etc",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin/","/usr/lcoal/sbin/"],
		command		=> 'chkconfig --add mongodb',
		refreshonly	=> true,	#避免重复执行追加动作.如果是cat命令.效果将是很明显的.
		require		=> File["/etc/init.d/mongodb"],
		notify		=> Exec["mkdir-etc-mongodb"],
	}
	exec { "mkdir-etc-mongodb":
		cwd		=> "/etc",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin/","/usr/lcoal/sbin/"],
		command		=> 'mkdir -p /etc/mongodb',
		refreshonly	=> true,	#避免重复执行追加动作.如果是cat命令.效果将是很明显的.
		require		=> Exec["add-mongodb-service"],
		notify		=> File["/etc/mongodb/mongodb.conf"],
	}
	file { "/etc/mongodb/mongodb.conf":
		owner		=> root,
		group		=> root,
		mode		=> 644,
		ensure		=> present,
		source		=> "puppet://$puppetserver/modules/mongodb/etc/mongodb/mongodb.conf",
		require		=> Exec["mkdir-etc-mongodb"],
		notify		=> Class["mongodb::clean-software"],
	}
}

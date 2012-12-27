class redis::config {
	File {
		owner		=> "root",
		group		=> "root",
		require		=> Class['redis::install'],
	}
	file { "/etc/profile.d/redis.sh":
		owner		=> root,
		group		=> root,
		mode		=> 644,
		ensure		=> present,
		source		=> "puppet://$puppetserver/modules/redis/etc/profile.d/redis.sh",
#		name		=> "/tmp/profile",
#		content		=> template("jdk/profile.erb"),
		require		=> Class["redis::install"],
		before		=> Exec["update-redis-profile"],
		notify		=> Exec["update-redis-profile"],
	}
	exec { "update-redis-profile":
		cwd		=> "/etc",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin/","/usr/lcoal/sbin/"],
		command		=> 'echo ". /etc/profile"| bash', #此命令貌似不好用，先加上吧
		require		=> File["/etc/profile.d/redis.sh"],
		refreshonly	=> true,	#避免重复执行追加动作.如果是cat命令.效果将是很明显的.
		notify		=> File["/etc/init.d/redis"],
	}
	file { "/etc/init.d/redis":
		owner		=> root,
		group		=> root,
		mode		=> 755,
		ensure		=> present,
		source		=> "puppet://$puppetserver/modules/redis/etc/init.d/redis",
		require		=> Exec["update-redis-profile"],
		notify		=> Exec["add-redis-service"],
	}
	exec { "add-redis-service":
		cwd		=> "/etc",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin/","/usr/lcoal/sbin/"],
		command		=> 'chkconfig --add redis',
		refreshonly	=> true,	#避免重复执行追加动作.如果是cat命令.效果将是很明显的.
		require		=> File["/etc/init.d/redis"],
		notify		=> Exec["mkdir-etc-redis"],
	}
	exec { "mkdir-etc-redis":
		cwd		=> "/etc",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin/","/usr/lcoal/sbin/"],
		command		=> 'mkdir -p /etc/redis',
		refreshonly	=> true,	#避免重复执行追加动作.如果是cat命令.效果将是很明显的.
		require		=> Exec["add-redis-service"],
		notify		=> File["/etc/redis/redis.conf"],
	}
	file { "/etc/redis/redis.conf":
		owner		=> root,
		group		=> root,
		mode		=> 644,
		ensure		=> present,
		source		=> "puppet://$puppetserver/modules/redis/etc/redis/redis.conf",
		require		=> Exec["mkdir-etc-redis"],
		notify		=> Class["redis::clean-software"],
	}
}

class apache-maven::config {
	File {
		owner		=> "root",
		group		=> "root",
		mode		=> 0440,
		require		=> Class['apache-maven::install'],
	}
	file { "/etc/profile.d/apache-maven.sh":
		owner		=> root,
		group		=> root,
		mode		=> 644,
		ensure		=> present,
		source		=> "puppet://$puppetserver/modules/apache-maven/etc/profile.d/apache-maven.sh",
#		name		=> "/tmp/profile",
#		content		=> template("jdk/profile.erb"),
		require		=> Class["apache-maven::install"],
		before		=> Exec["update-apache-maven-profile"],
		notify		=> Exec["update-apache-maven-profile"],
	}
	exec { "update-apache-maven-profile":
		cwd		=> "/etc",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin/","/usr/lcoal/sbin/"],
		command		=> 'echo ". /etc/profile"| bash', #此命令貌似不好用，先加上吧
		require		=> File["/etc/profile.d/apache-maven.sh"],
		refreshonly	=> true,	#避免重复执行追加动作.如果是cat命令.效果将是很明显的.
		notify		=> Class["apache-maven::clean-software"],
	}
}

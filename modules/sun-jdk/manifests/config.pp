class sun-jdk::config {
	File {
		owner		=> "root",
		group		=> "root",
		mode		=> 0440,
		require		=> Class['sun-jdk::install'],
        }
	file { "/etc/profile.d/sun-jdk.sh": 
		owner		=> root,
		group		=> root,
		mode		=> 644,
		ensure		=> present,
		source		=> "puppet://$puppetserver/modules/sun-jdk/etc/profile.d/sun-jdk.sh",
#		name		=> "/tmp/profile",
#		content		=> template("jdk/profile.erb"),
		require		=> Class["sun-jdk::install"],
		before		=> Exec["update-profile"],
		notify		=> Exec["update-profile"],
	}
	exec { "update-profile":
		cwd		=> "/etc",
		path		=> [ "/bin/","/sbin/","/usr/bin/","/usr/sbin/"],
		command		=> 'echo ". /etc/profile"| bash', #此命令貌似不好用，先加上吧
		require		=> File["/etc/profile.d/sun-jdk.sh"],
		refreshonly	=> true,	#避免重复执行追加动作.如果是cat命令.效果将是很明显的.
		notify		=> Class["sun-jdk::clean-software"],
	}
}

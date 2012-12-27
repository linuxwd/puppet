class apache-ant::config {
	File {
		owner		=> "root",
		group		=> "root",
		mode		=> 0440,
		require		=> Class['apache-ant::install'],
        }
	file { "/etc/profile.d/apache-ant.sh":
		owner		=> root,
		group		=> root,
		mode		=> 644,
		ensure		=> present,
		source		=> "puppet://$puppetserver/modules/apache-ant/etc/profile.d/apache-ant.sh",
#		name		=> "/tmp/profile",
#		content		=> template("jdk/profile.erb"),
		require		=> Class["apache-ant::install"],
		before		=> Exec["update-apache-ant-profile"],
		notify		=> Exec["update-apache-ant-profile"],
	}
	exec { "update-apache-ant-profile":
		cwd		=> "/etc",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin/","/usr/lcoal/sbin/"],
		command		=> 'echo ". /etc/profile"| bash', #此命令貌似不好用，先加上吧
		require		=> File["/etc/profile.d/apache-ant.sh"],
		refreshonly	=> true,	#避免重复执行追加动作.如果是cat命令.效果将是很明显的.
		notify		=> Class["apache-ant::clean-software"],
	}
}

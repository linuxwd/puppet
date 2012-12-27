class redis::prepare {
	file { "/tmp/redis-2.6.7.tar.gz":
		owner		=> root,
		group		=> root,
		mode		=> 644,
		source		=> "puppet://$puppetserver/modules/redis/redis-2.6.7.tar.gz",
		recurse		=> true,
		notify		=> Class['redis::install']
	}
}

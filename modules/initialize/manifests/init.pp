class default-define {
	exec { 'yum Group Install':
		unless  => '/usr/bin/yum grouplist "Emacs" | /bin/grep "^Installed Groups"',
		command => '/usr/bin/yum -y groupinstall "Emacs"',
		}
        exec { 'yum Group Install TEX':
#                unless  => '/usr/bin/yum grouplist "TeX support" | /bin/grep "^Installed Groups"',
                command => '/usr/bin/yum -y groupinstall "TeX support"',
                }
	}
class default-new {
	include default-define
	}
#define yumgroup($ensure = "present", $optional = false) {
#   case $ensure {
#      present,installed: {
#         $pkg_types_arg = $optional ? {
#            true => "--setopt=group_package_types=optional,default,mandatory",
#            default => ""
#         }
#         exec { "Installing $name yum group":
#            command => "yum -y groupinstall $pkg_types_arg $name",
#            unless => "yum -y groupinstall $pkg_types_arg $name --downloadonly",
#            timeout => 600,
#         }
#      }
#   }
#}
#class yum_groupinstalls { yumgroup { '"Development tools"': } }

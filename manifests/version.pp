class php::version (
  $php_version = undef,
){
  if $::osfamily == 'Redhat' {
    if $php_version == '7.2' {
      exec { "sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/remi-php72.repo":
        onlyif => 'test -f /etc/yum.repos.d/remi-php72.repo',
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
      exec { "sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/remi-php71.repo":
        onlyif => 'test -f /etc/yum.repos.d/remi-php71.repo',
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
      exec { "sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/remi-php70.repo":
        onlyif => 'test -f /etc/yum.repos.d/remi-php70.repo',
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
    }
    elsif $php_version == '7.1' {
      exec { "sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/remi-php72.repo":
        onlyif => 'test -f /etc/yum.repos.d/remi-php72.repo',
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
      exec { "sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/remi-php71.repo":
        onlyif => 'test -f /etc/yum.repos.d/remi-php71.repo',
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
      exec { "sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/remi-php70.repo":
        onlyif => 'test -f /etc/yum.repos.d/remi-php70.repo',
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
    }
    elsif $php_version == '7.0' {
      exec { "sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/remi-php72.repo":
        onlyif => 'test -f /etc/yum.repos.d/remi-php72.repo',
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
      exec { "sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/remi-php71.repo":
        onlyif => 'test -f /etc/yum.repos.d/remi-php71.repo',
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
      exec { "sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/remi-php70.repo":
        onlyif => 'test -f /etc/yum.repos.d/remi-php70.repo',
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
    }
  }
  elsif $::osfamily == 'Debian' {
    if $::operatingsystem == 'Ubuntu' and $php_version != undef {
      package { 'python-software-properties': ensure => installed }
      package { 'software-properties-common': ensure => installed }
      exec { 'add-apt-repository ppa:ondrej/php':
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
      exec { 'apt-get update':
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
    }
    elsif $::operatingsystem == 'Debian' and $php_version != undef {
      package { 'apt-transport-https': ensure => installed }
      package { 'lsb-release': ensure => installed }
      package { 'ca-certificates': ensure => installed }
      exec { 'wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg':
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
      exec { 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list':
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
      exec { 'apt-get update':
        path   => '/usr/bin:/usr/sbin:/bin:/sbin',
      }
    }
    if $php_version == '7.2' {
      $ver = true
      $package_name = [ 'php7.2', 'libapache2-mod-php7.2' ]
      $package_name_fpm = [ 'php7.2-fpm' ]
      $configfile = '/etc/php/7.2/apache2/php.ini'
      $configfile_fpm = '/etc/php/7.2/fpm/php.ini'
      $configfile_wwwconf = '/etc/php/7.2/fpm/pool.d/www.conf'
    }
    elsif $php_version == '7.1' {
      $ver = true
      $package_name = [ 'php7.1', 'libapache2-mod-php7.1' ]
      $package_name_fpm = [ 'php7.1-fpm' ]
      $configfile = '/etc/php/7.1/apache2/php.ini'
      $configfile_fpm = '/etc/php/7.1/fpm/php.ini'
      $configfile_wwwconf = '/etc/php/7.1/fpm/pool.d/www.conf'
    }
    elsif $php_version == '7.0' {
      $ver = true
      $package_name = [ 'php7.0', 'libapache2-mod-php7.0' ]
      $package_name_fpm = [ 'php7.0-fpm' ]
      $configfile = '/etc/php/7.0/apache2/php.ini'
      $configfile_fpm = '/etc/php/7.0/fpm/php.ini'
      $configfile_wwwconf = '/etc/php/7.0/fpm/pool.d/www.conf'
    }
    elsif $php_version == '5.6' {
      $ver = true
      $package_name = [ 'php5.6', 'libapache2-mod-php5.6' ]
      $package_name_fpm = [ 'php5.6-fpm' ]
      $configfile = '/etc/php/5.6/apache2/php.ini'
      $configfile_fpm = '/etc/php/5.6/fpm/php.ini'
      $configfile_wwwconf = '/etc/php/5.6/fpm/pool.d/www.conf'
    }
    else {
      $ver = undef
    }
  }
}

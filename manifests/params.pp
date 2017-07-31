class php::params inherits php::version {
  $ver = $::php::version::ver
  if $::osfamily == 'Redhat' {
    $package_name = [ 'php' ]
    $package_name_fpm = [ 'php-fpm' ]
    $configfile = '/etc/php.ini'
    $configfile_fpm = '/etc/php.ini'
    $configfile_wwwconf = '/etc/php-fpm.d/www.conf'
  }
  elsif $::osfamily == 'Debian' and $ver == undef {
    if $::operatingsystem == 'Ubuntu' {
      case $::operatingsystemrelease {
        /^12.*/: {
          $package_name = [ 'php5', 'libapache2-mod-php5' ]
          $package_name_fpm = [ 'php5-fpm' ]
          $configfile = '/etc/php5/apache2/php.ini'
          $configfile_fpm = '/etc/php5/fpm/php.ini'
          $configfile_wwwconf = '/etc/php5/fpm/pool.d/www.conf'
        }
        /^14.*/: {
          $package_name = [ 'php5', 'libapache2-mod-php5' ]
          $package_name_fpm = [ 'php5-fpm' ]
          $configfile = '/etc/php5/apache2/php.ini'
          $configfile_fpm = '/etc/php5/fpm/php.ini'
          $configfile_wwwconf = '/etc/php5/fpm/pool.d/www.conf'
        }
        /^16.*/: {
          $package_name = [ 'php', 'libapache2-mod-php' ]
          $package_name_fpm = [ 'php-fpm' ]
          $configfile = '/etc/php/7.0/apache2/php.ini'
          $configfile_fpm = '/etc/php/7.0/fpm/php.ini'
          $configfile_wwwconf = '/etc/php/7.0/fpm/pool.d/www.conf'
        }
        /^17.*/: {
          $package_name = [ 'php', 'libapache2-mod-php' ]
          $package_name_fpm = [ 'php-fpm' ]
          $configfile = '/etc/php/7.0/apache2/php.ini'
          $configfile_fpm = '/etc/php/7.0/fpm/php.ini'
          $configfile_wwwconf = '/etc/php/7.0/fpm/pool.d/www.conf'
        }
        default: {
          $package_name = [ 'php5', 'libapache2-mod-php5' ]
          $package_name_fpm = [ 'php5-fpm' ]
          $configfile = '/etc/php5/apache2/php.ini'
          $configfile_fpm = '/etc/php5/fpm/php.ini'
          $configfile_wwwconf = '/etc/php5/fpm/pool.d/www.conf'
        }
      }
    }
    elsif $::operatingsystem == 'Debian' {
      case $::operatingsystemrelease {
        /^9.*/: {
          $package_name = [ 'php', 'libapache2-mod-php' ]
          $package_name_fpm = [ 'php-fpm' ]
          $configfile = '/etc/php/7.0/apache2/php.ini'
          $configfile_fpm = '/etc/php/7.0/fpm/php.ini'
          $configfile_wwwconf = '/etc/php/7.0/fpm/pool.d/www.conf'
        }
        default: {
          $package_name = [ 'php5', 'libapache2-mod-php5' ]
          $package_name_fpm = [ 'php5-fpm' ]
          $configfile = '/etc/php5/apache2/php.ini'
          $configfile_fpm = '/etc/php5/fpm/php.ini'
          $configfile_wwwconf = '/etc/php5/fpm/pool.d/www.conf'
        }
      }
    }
  }
  if $ver != undef {
    $package_name = $::php::version::package_name
    $package_name_fpm = $::php::version::package_name_fpm
    $configfile = $::php::version::configfile
    $configfile_fpm = $::php::version::configfile_fpm
    $configfile_wwwconf = $::php::version::configfile_wwwconf
  }
}

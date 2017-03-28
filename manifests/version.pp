class php::version (
  $php_version = undef,
){
  if $::osfamily == 'Debian' {
    if $php_version == '7.1' {
      $ver = true
      $packagename_mod = [ 'php7.1-mcrypt', 'php7.1-gd', 'libapache2-mod-php7.1' ]
      $package_name = [ 'php7.1' ]
      $package_name_fpm = [ 'php7.1-fpm' ]
      $configfile = '/etc/php/7.1/apache2/php.ini'
      $configfile_fpm = '/etc/php/7.1/fpm/php.ini'
      $configfile_wwwconf = '/etc/php/7.1/fpm/pool.d/www.conf'
    }
    else {
      $ver = undef
    }
  }
}

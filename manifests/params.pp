# == Class: redis::params
#
class redis::params {
  $redis_build_dir       = '/opt'
  $redis_install_dir     = '/usr/bin'
  $redis_install_package = true
  $download_tool         = 'curl -s -L'

  $redis_version = $redis_install_package ? {
    true  => 'latest',
    false => 'stable',
  }

  if $::operatingsystem == 'Debian' and $::operatingsystemmajrelease >= 8 {
    $use_systemd = true
  } else {
    $use_systemd = false
  }
}

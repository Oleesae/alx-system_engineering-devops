# creates a file school, mode, owner, group & content
file { '/tmp/school':
  path    => '/tmp/school',
  mode    => '0744',
  owner   => www-data,
  group   => www-data,
  content => 'I love Puppet'
}

#!/usr/bin/pup
# executes a command
exec { 'pkill':
  command  => 'pkill killmenow',
  provider => 'shell'
}

#!/usr/bin/env ruby

require 'rubygems'

# include path
$:.unshift File.dirname(__FILE__)

require 'exec_with_timeout.rb'

command = "ruby -e \"(1..100).each {|x| puts x; sleep 1}\""
output = Exec_With_Timeout.exec command, 10
puts output

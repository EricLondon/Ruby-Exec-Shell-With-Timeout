#!/usr/bin/env ruby

require 'rubygems'

# include path
$:.unshift File.dirname(__FILE__)

require 'exec_with_timeout.rb'

command = "./test.rb"
output = Exec_With_Timeout.exec command, 5
puts output

#loop {}

#!/usr/bin/env ruby

require 'logger'

log = Logger.new('./log.txt')

(1..20).each do |i|
  puts i
  log.debug i
  sleep 1
end

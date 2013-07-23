#!/usr/bin/env ruby

require 'rubygems'
require 'timeout'
require 'pty'

class Exec_With_Timeout

  def self.main
    begin
      Timeout.timeout @timeout do
        PTY.spawn @command do |r,w,p|

          loop do

            begin
              line = r.gets
              @output << line if !line.nil?
            rescue
            end

            begin
              # check if child process is running
              Process.getpgid p
            rescue Errno::ESRCH => e
              raise Timeout::Error
            end

          end
        end
      end
    rescue Timeout::Error

    end
    @output
  end

  def self.exec(command, timeout)
    @command = command
    @timeout = timeout
    @output = ""

    self.main
  end

end

#!/usr/bin/env ruby

require 'rubygems'
require 'timeout'
require 'pty'

class Exec_With_Timeout

  def Exec_With_Timeout.main
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

  def Exec_With_Timeout.exec(command, timeout)
    @command = command
    @timeout = timeout
    @output = ""

    Exec_With_Timeout.main
  end

end

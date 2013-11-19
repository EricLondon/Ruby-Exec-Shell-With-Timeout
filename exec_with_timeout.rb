#!/usr/bin/env ruby

require 'rubygems'
require 'timeout'
require 'pty'

class Exec_With_Timeout

  def self.main

    begin

      # spawn process
      PTY.spawn @command do |r,w,pid|
        @pid = pid
        @read = r
        @write = w

        # start timeout
        Timeout.timeout @timeout do

          loop do

            # get output line
            begin
              line = @read.gets
              @output << line if !line.nil?
            rescue
            end

            # check if process is still running
            begin
              Process.getpgid @pid
            rescue
              raise Timeout::Error
            end

          end

        end

      end

    # catch timeout
    rescue Timeout::Error
      begin
        Process.kill 9, @pid
      rescue
      end
    end

    @output

  end

  def self.exec(command, timeout)
    @pid = nil
    @command = command
    @timeout = timeout
    @output = ""

    self.main
  end

end

Ruby-Exec-Shell-With-Timeout
============================

Ruby Exec Shell With Timeout

Example Usage (see: example.rb)

```ruby
#!/usr/bin/env ruby

require 'rubygems'

# include path
$:.unshift File.dirname(__FILE__)

require 'exec_with_timeout.rb'

command = %{ruby -e "(1..100).each {|x| puts x; sleep 1}"}
output = Exec_With_Timeout.exec command, 10
puts output
```

```bash
$ ./example.rb
1
2
3
4
5
6
7
8
9
10
```

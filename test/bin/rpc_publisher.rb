#!/usr/bin/env ruby
ENV['LOCAL'] = 'redis://localhost'

require 'rcom'

node = Rcom::Node.new('local').connect
auth = Rcom::Request.new(node: node, service: 'auth')
p auth.get_key(user: 1)

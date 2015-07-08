#!/usr/bin/env ruby

def are_you_sure?
  while true
    print "Are you sure? [y/n]: "
    response = gets
    case response
    when /^[yY]/
      return true
    when /^[nN]/, /^$/
      return false
    end
  end
end

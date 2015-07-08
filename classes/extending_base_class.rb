#!/usr/bin/env ruby

# checks if class is either blank or nil
# by giving nil and string a common class
class NilClass
  def blank?
    true
  end
end

class String
  def blank?
    self.size == 0
  end
end

# example
# ["", "person", nil].each do |element|
#   puts element unless element.blank?
# end

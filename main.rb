require_relative 'lots'
require_relative 'make'

lots = Lots.new
lots.get_lots(1)
lots.run
puts lots.dict

makes = Make.new

lots.dict.each do |key, value|
  makes.post_make(key, value)
end

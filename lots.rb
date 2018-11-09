require 'httparty'

class Lots
  @@uri = "http://localhost:3001/api/lots"

  def getLots (page)
    HTTParty.get @@uri + "?page=" + page.to_s
  end



end

d = Lots.new

puts d.getLots(2)
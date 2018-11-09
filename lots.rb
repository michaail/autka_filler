require 'httparty'

class Lots
  @@baseURI = 'http://localhost:3001/api/lots'
  @@dict = {}
  @pages = 0

  # get lots page from api
  def get_lots (page)
    res = HTTParty.get "#{@@baseURI}?page=#{page.to_s}"
    @pages = res.parsed_response['meta']['pages_count']
    res.parsed_response['documents']
  end

  def makes_of_page (documents)
    documents.each do |doc|
      # puts doc
      make = doc['make']
      model = doc['model']
      # puts @@dict
      if @@dict.key? make
        if @@dict[make].include? model
        else
          arr = @@dict[make]
          arr.append model
          @@dict[make] = arr
        end

      else
        @@dict.merge!(make => [model])
      end
    end
  end

  def run
    get_lots(1)
    for i in Range.new(0, Integer(@pages))
      makes_of_page(get_lots(i))
    end
  end

  def dict
    run
    @@dict
  end


end

lot = Lots.new
lot.get_lots(1)
lot.run
puts lot.dict

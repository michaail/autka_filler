require 'httparty'
require_relative 'lots'

class Make
  @@base_uri = 'http://localhost:3001/api/makes'
  @@makes = []

  def retrieve_makes
    response = HTTParty.get @@base_uri
    response.parsed_response
  end

  def post_make(make)
    res = HTTParty.post("#{@@base_uri}",
                        body: { 'make': make})
  end

  def build_make_arr
    documents = retrieve_makes
    documents.each do |doc|
      @@makes.append doc['make']
    end
  end

  def makes
    @@makes
  end

end

d = Make.new
d.build_make_arr
puts d.retrieve_makes
puts d.makes

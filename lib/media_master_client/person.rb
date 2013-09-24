# encoding: UTF-8

class MediaMasterClient::Person
  
  extend MediaMasterClient::Base
  
  def self.create(data)
    Hashie::Mash.new JSON.parse(self.connection.post(ENV['SITE'] + '/api/v1/people', params: {person: data}).body)
  end
  
  def self.find_or_create_by_imdb_id(imdb_id, data)
    if movie = self.find_by_imdb_id(imdb_id)
      return movie
    else
      return self.create(data)
    end
  end
  
  def self.find_by_imdb_id(imdb_id)
    response = JSON.parse(self.connection.get(ENV['SITE'] + '/api/v1/people/search', params: {imdb_id: imdb_id}).body)
    if response.length > 0
      Hashie::Mash.new response
    else
      nil
    end
  end
  
end

# encoding: UTF-8

class MediaMasterClient::Movie < MediaMasterClient::Base

  def self.create(data)
    self.post_and_parse(@@host + '/api/v1/movies', body: {movie: data})
  end

  def self.find_or_create_by_imdb_id(imdb_id, data)
    if movie = self.find_by_imdb_id(imdb_id)
      return movie
    else
      return self.create(data)
    end
  end

  def self.find_by_imdb_id(imdb_id)
    response = ::JSON.parse(self.connection.get(@@host + '/api/v1/movies/search', params: {imdb_id: imdb_id}).body)
    if response.length > 0
      Hashie::Mash.new response
    else
      nil
    end
  end

end

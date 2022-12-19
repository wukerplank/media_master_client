# encoding: UTF-8

class MediaMasterClient::Person < MediaMasterClient::Base

  def self.create(data)
    self.post_and_parse(@@host + '/api/v2/people', body: {person: data})
  end

  def self.find_or_create_by_imdb_id(imdb_id, data)
    if person = self.find_by_imdb_id(imdb_id)
      return person
    else
      return self.create(data)
    end
  end

  def self.find_by_imdb_id(imdb_id)
    self.get_and_parse @@host + '/api/v2/people/search', params: {imdb_id: imdb_id}
  end

end

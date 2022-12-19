# encoding: UTF-8

class MediaMasterClient::Tvshow < MediaMasterClient::Base

  def self.create(data)
    self.post_and_parse(@@host + '/api/v1/tvshows', body: {tvshow: data})
  end

  def self.find_or_create_by_imdb_id(imdb_id, data)
    if tvshow = self.find_by_imdb_id(imdb_id)
      return tvshow
    else
      return self.create(data)
    end
  end

  def self.find_by_imdb_id(imdb_id)
    self.get_and_parse @@host + '/api/v2/tvshows/search', params: {imdb_id: imdb_id}
  end

end

# encoding: UTF-8

class MediaMasterClient::Episode
  
  extend MediaMasterClient::Base
  
  def self.create(tvshow_id, season_id, data)
    self.post_and_parse(ENV['SITE'] + '/api/v1/tvshows/' + tvshow_id + '/seasons/' + season_id + '/episodes', params: {episode: data})
  end
  
  def self.find_or_create_by_imdb_id(tvshow_id, season_id, imdb_id, data)
    if tvshow = self.find_by_imdb_id(imdb_id)
      return tvshow
    else
      return self.create(data)
    end
  end
  
  def self.find_by_imdb_id(tvshow_id, season_id, imdb_id)
    response = ::JSON.parse(self.connection.get(ENV['SITE'] + '/api/v1/tvshows/' + tvshow_id + '/seasons/' + season_id + '/episodes/search', params: {imdb_id: imdb_id}).body)
    if response.length > 0
      Hashie::Mash.new response
    else
      nil
    end
  end
  
end

# encoding: UTF-8

class MediaMasterClient::Episode < MediaMasterClient::Base

  def self.create(tvshow_id, season_id, data)
    self.post_and_parse(@@host + '/api/v1/tvshows/' + tvshow_id + '/seasons/' + season_id + '/episodes', body: {episode: data})
  end

  def self.find_or_create_by_imdb_id(tvshow_id, season_id, imdb_id, data)
    if tvshow = self.find_by_imdb_id(tvshow_id, season_id, imdb_id)
      return tvshow
    else
      return self.create(tvshow_id, season_id, data)
    end
  end

  def self.find_by_imdb_id(tvshow_id, season_id, imdb_id)
    self.get_and_parse @@host + '/api/v1/tvshows/' + tvshow_id + '/seasons/' + season_id + '/episodes/search', params: {imdb_id: imdb_id}
  end

end

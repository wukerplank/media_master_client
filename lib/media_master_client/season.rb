# encoding: UTF-8

class MediaMasterClient::Season < MediaMasterClient::Base

  def self.create(tvshow_id, data)
    self.post_and_parse(@@host + '/api/v2/tvshows/' + tvshow_id + '/seasons', body: {season: data})
  end

  def self.find_or_create_by_number(tvshow_id, number, data)
    if tvshow = self.find_by_number(tvshow_id, number)
      return tvshow
    else
      return self.create(data)
    end
  end

  def self.find_by_number(tvshow_id, number)
    self.get_and_parse @@host + '/api/v2/tvshows/' + tvshow_id + '/seasons/search', params: {imdb_id: imdb_id}
  end

end

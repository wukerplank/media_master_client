# encoding: UTF-8

class MediaMasterClient::Season < MediaMasterClient::Base

  def self.create(tvshow_id, data)
    self.post_and_parse(@@host + '/api/v1/tvshows/' + tvshow_id + '/seasons', params: {season: data})
  end

  def self.find_or_create_by_number(tvshow_id, number, data)
    if tvshow = self.find_by_number(tvshow_id, number)
      return tvshow
    else
      return self.create(data)
    end
  end

  def self.find_by_number(tvshow_id, number)
    response = ::JSON.parse(self.connection.get(@@host + '/api/v1/tvshows/' + tvshow_id + '/seasons/search', params: {number: number}).body)
    if response.length > 0
      Hashie::Mash.new response
    else
      nil
    end
  end

end

# encoding: UTF-8

class MediaMasterClient::Directing < MediaMasterClient::Base

  def self.create(data)
    self.post_and_parse(@@host + '/api/v2/directings', body: {directing: data})
  end

end

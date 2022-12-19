# encoding: UTF-8

class MediaMasterClient::Acting < MediaMasterClient::Base

  def self.create(data)
    self.post_and_parse(@@host + '/api/v2/actings', body: {acting: data})
  end

end

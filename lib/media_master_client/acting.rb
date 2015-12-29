# encoding: UTF-8

class MediaMasterClient::Acting < MediaMasterClient::Base

  def self.create(data)
    Hashie::Mash.new JSON.parse(self.connection.post(@@host + '/api/v1/actings', body: {acting: data}).body)
  end

end

# encoding: UTF-8

class MediaMasterClient::Directing < MediaMasterClient::Base

  def self.create(data)
    Hashie::Mash.new JSON.parse(self.connection.post(@@host + '/api/v1/directings', body: {directing: data}).body)
  end

end

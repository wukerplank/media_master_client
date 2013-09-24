# encoding: UTF-8

class MediaMasterClient::Directing
  
  extend MediaMasterClient::Base
  
  def self.create(data)
    Hashie::Mash.new JSON.parse(self.connection.post(ENV['SITE'] + '/api/v1/directings', params: {directing: data}).body)
  end
    
end

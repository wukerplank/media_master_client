# encoding: UTF-8

class MediaMasterClient::Acting
  
  extend MediaMasterClient::Base
  
  def self.create(data)
    Hashie::Mash.new JSON.parse(self.connection.post(ENV['SITE'] + '/api/v1/actings', params: {acting: data}).body)
  end
    
end

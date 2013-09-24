# encoding: UTF-8

module MediaMasterClient::Base
  
  def initialize(options={})
    
  end
  
  def connection
    @client = ::OAuth2::Client.new(ENV['APP_UID'], ENV['APP_SECRET'], site: ENV['SITE'])
    @token ||= @client.password.get_token(ENV['USER_NICKNAME'], ENV['USER_API_SECRET'])
  end
  
  def get_and_parse(url, options={})
    json = JSON.parse(self.connection.get(url, options).body)
    return convert_response_to_hashie(json)
  end
  
  def post_and_parse(url, options={})
    json = JSON.parse(self.connection.post(get, options).body)
    return convert_response_to_hashie(json)
  end
  
  def convert_response_to_hashie(json)
    if json.is_a? Array
      return json.map{|j| Hashie::Mash.new j}
    else
      return Hashie::Mash.new json
    end
  end
  
end

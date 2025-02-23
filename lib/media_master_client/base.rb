# encoding: UTF-8

require "faraday"

class MediaMasterClient::Base

  def self.configure(&block)
    yield self
  end

  def self.app_uid=(app_uid)
    @@app_uid = app_uid
  end

  def self.app_uid
    @@app_uid
  end

  def self.app_secret=(app_secret)
    @@app_secret = app_secret
  end

  def self.app_secret
    @@app_secret
  end

  def self.host=(host)
    @@host = host
  end

  def self.host
    @@host
  end

  def self.username=(username)
    @@username = username
  end

  def self.username
    @@username
  end

  def self.password=(password)
    @@password = password
  end

  def self.password
    @@password
  end




  def initialize(options={})

  end

  def self.connection
    @@client ||= Faraday.new do |conn|
      conn.adapter :net_http
      conn.request :url_encoded
      # conn.response :logger
      conn.set_basic_auth @@username, @@password
    end
    # @@client ||= ::OAuth2::Client.new(@@app_uid, @@app_secret, site: @@host)
    # @@token = @@client.password.get_token(@@username, @@password)
  end

  def self.get_and_parse(url, options={})
    json = JSON.parse(self.connection.get(url, options[:params]).body)
    if json.class == Hash && json.empty?
      return nil
    end
    return convert_response_to_hashie(json)
  end

  def self.post_and_parse(url, options={})
    response = self.connection.post(url) do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = JSON.dump(options[:body])
    end
    json = JSON.parse(response.body)
    return convert_response_to_hashie(json)
  end

  def self.convert_response_to_hashie(json)
    if json.is_a? Array
      return json.map{|j| Hashie::Mash.new j}
    else
      return Hashie::Mash.new json
    end
  end

end

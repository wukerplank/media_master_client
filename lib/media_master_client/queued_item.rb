# encoding: UTF-8

class MediaMasterClient::QueuedItem < MediaMasterClient::Base

  def self.all
    self.get_and_parse(@@host + '/api/v2/queued_items')
  end

  # def self.create(data)
    # self.post_and_parse(SITE + '/api/v1/evergreens', params: {directing: data})
  #   Hashie::Mash.new JSON.parse(self.connection.post(SITE + '/api/v1/evergreens', params: {directing: data}).body)
  # end

end

# encoding: utf-8

class MediaMasterClient::OwnedFile < MediaMasterClient::Base

  def self.all
    self.get_and_parse(@@host + '/api/v1/owned_files')
  end

  def self.batch_update(data)
    Hashie::Mash.new JSON.parse(self.connection.patch(@@host + '/api/v1/owned_files/batch_update', params: {owned_files: JSON.dump(data)}).body)
  end

end

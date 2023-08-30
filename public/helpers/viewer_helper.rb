require 'net/http'
require 'json'

class ViewerHelper
  def self.get_thumbnail(file_uri)
    if file_uri.include?("manifest.json")
      return file_uri.gsub!('manifest.json', 'full/,120/0/default.jpg')
    elsif file_uri.include?("kaltura.com")
      entry_id = file_uri.split("/")[-1]
      return "https://cfvod.kaltura.com/p/2356971/sp/235697100/thumbnail/entry_id/#{entry_id}"
    else
      return file_uri
    end
  end
end

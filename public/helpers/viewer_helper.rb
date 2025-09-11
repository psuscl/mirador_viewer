require 'net/http'
require 'json'

class ViewerHelper
  def self.get_thumbnail(file_uri)
    # this is a truly disgusting way to do this but I'm not sure how else to get a thumbnail from a CONTENTdm IIIF manifest
    if file_uri.include?("manifest.json")
      file_uri.gsub!(/http(s)?:\/\//,'')
      array = file_uri.split('/')
      return "https://#{array[0]}/digital/api/singleitem/collection/#{array[3].gsub!(':','/id/')}/thumbnail"
    elsif file_uri.include?("kaltura.com")
      entry_id = file_uri.split("/")[-1]
      return "https://cfvod.kaltura.com/p/2356971/sp/235697100/thumbnail/entry_id/#{entry_id}"
    else
      return file_uri
    end
  end
end

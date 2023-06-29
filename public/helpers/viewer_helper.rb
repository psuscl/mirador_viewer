require 'net/http'
require 'json'

class ViewerHelper
  def self.get_thumbnail(file_uri)
    if file_uri.include?("manifest.json")
      response = Net::HTTP.get_response(URI(file_uri))
      if response.is_a?(Net::HTTPSuccess)
        manifest = JSON.parse(response.body)
        tn = manifest['sequences']
          .first['canvases']
          .first['images']
          .first['resource']['@id']
        return tn.gsub!('full/full', 'full/,120')
      else
        return file_uri
      end
    elsif file_uri.include?("kaltura.com")
      entry_id = file_uri.split("/")[-1]
      return "https://cfvod.kaltura.com/p/2356971/sp/235697100/thumbnail/entry_id/#{entry_id}"
    else
      return file_uri
    end
  end
end
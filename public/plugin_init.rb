require_relative 'helpers/viewer_helper'

if !AppConfig.has_key?('enable_representative_file_version')
  AppConfig[:enable_representative_file_version] = false
end

AppConfig[:enable_mirador] = true
AppConfig[:enable_kaltura] = true

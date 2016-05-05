module GoogleVisionHelper
  require 'googleauth'
  require 'google/apis/vision_v1'

  vision = Google::Apis::VisionV1::VisionService.new

  scopes =  ['https://www.googleapis.com/auth/cloud-platform', 'https://www.googleapis.com/auth/vision']
  vision.authorization = Google::Auth.get_application_default(scopes)

end
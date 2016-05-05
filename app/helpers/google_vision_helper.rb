module GoogleVisionHelper
  
  require 'googleauth'
  require 'google/apis/vision_v1'
  require 'open-uri'
  require 'faraday'

  # http://simon.rentzke.com/google-cloud-vision-api-on-ruby
  
  def has_cat?(url)
    image = open(url) { |f| f.read }
    encoded = Base64.encode64(image)
    data_hash = {
      requests: [{
        image: { content: encoded },
        features: [{ 
          type: "LABEL_DETECTION", 
          maxResults: 15
          }]
      }]
    }
    body = data_hash.to_json
    conn = Faraday.new(:url => 'https://vision.googleapis.com')
    response = conn.post do |req|
      req.url '/v1/images:annotate?key=' + ENV["GOOGLE_APPLICATION_API_KEY"]
      req.headers['Content-Type'] = 'application/json'
      req.body = body
    end
    parsed_response = JSON.parse(response.body)
    descriptions = parsed_response["responses"][0]["labelAnnotations"].map do |obj|
      obj["description"]
    end
    valid_keywords = ["cat", "kitten"]
    p descriptions
    descriptions.each do |word|
      return true if valid_keywords.include?(word)
    end
    return false
  end

end

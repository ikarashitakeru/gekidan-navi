require "base64"
require "json"
require "net/https"

module Vision
  class << self
    def get_image_data(image_attachment)
      return [] unless image_attachment.attached?

      api_url = "https://vision.googleapis.com/v1/images:annotate?key=#{ENV["GOOGLE_API_KEY"]}"

      # Active Storage の画像をBase64に変換
      base64_image = Base64.strict_encode64(image_attachment.download)

      params = {
        requests: [{
          image: {
            content: base64_image
          },
          features: [
            {
              type: "LABEL_DETECTION"
            }
          ]
        }]
      }.to_json

      uri = URI.parse(api_url)

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true

      request = Net::HTTP::Post.new(uri.request_uri)
      request["Content-Type"] = "application/json"

      response = https.request(request, params)
      response_body = JSON.parse(response.body)
      

      if (error = response_body.dig("responses", 0, "error")).present?
        Rails.logger.error("Vision API Error: #{error["message"]}")
        raise error["message"]
      else
        response_body
          .dig("responses", 0, "labelAnnotations")
          &.pluck("description")
          &.take(3) || []
      end
    end
  end
end
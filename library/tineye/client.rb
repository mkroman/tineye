# encoding: utf-8

module TinEye
  class Client
    SearchURI = URI 'http://www.tineye.com/search'

    def initialize
      # …
    end

    def search image_url
      response = Net::HTTP.post_form SearchURI, url: image_url

      case response
      when Net::HTTPRedirection
        extract_images Net::HTTP.get URI response['location']
      else
        raise "Malformed result"
      end
    end

  private

    def extract_images response
      document = Nokogiri::HTML response
      
      document.xpath('//div[@class="result-match-details"]').map do |element|
        location = element.xpath('div/span/strong')[0].text
        links = element.xpath 'div/p/a'

        { host: location, direct: links[0]['href'], url: links[1]['href'] }
      end
    end
  end
end

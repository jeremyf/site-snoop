require 'open-uri'
require 'uri'
require 'net/http'
require 'net/https'

module SiteSnoop
  class Http
    REDIRECTION_LIMIT = 3
    class << self
      def get(url)
        url = URI.parse(url)
        response = get_response(url)
        code = Integer(response.code)
        loc = url

        limit = REDIRECTION_LIMIT
        while response.is_a?(Net::HTTPRedirection) and limit > 0
          loc = URI(response['location'])
          loc = url.merge(loc) if loc.relative?
          response = get_response(loc)
          limit -= 1
        end

        return response, code, url
      rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Errno::ECONNREFUSED => e
        puts e
        nil
      end

      protected
      #
      # Get an HTTPResponse for *url*, sending the appropriate User-Agent string
      #
      def get_response(url)
        full_path = File.join( '/', url.query.nil? ? url.path : "#{url.path}?#{url.query}")
        Net::HTTP.start(url.host, url.port) do |http|
          return http.get(full_path, {'User-Agent' => 'Ruby 1.0' })
        end
      end
    end
  end
end

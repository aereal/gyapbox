require "net/http"

class Gyapbox
  module URI
    class Availability
      def initialize(uri)
        @uri = uri
      end

      def available?
        http = Net::HTTP.new(@uri.host, @uri.port)
        res = http.head(@uri.path)
        (200...300) === res.code.to_i
      end
    end
  end
end

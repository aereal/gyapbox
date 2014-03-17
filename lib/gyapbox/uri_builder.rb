require "uri"

class Gyapbox
  module URI
    module Builder
      TEMPLATE = 'http://dl.dropboxusercontent.com/u/%s/%s'.freeze

      def self.build(args = {})
        user_id = args[:user_id]
        path    = args[:path]
        ::URI.parse(TEMPLATE % [user_id, path])
      end
    end
  end
end

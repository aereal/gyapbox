require "net/http"

class Gyapbox
  module URI
    class Availability
      class CannotSucceedWithinRetriesError < ::StandardError; end

      def initialize(uri)
        @uri = uri
      end

      def available?
        http = Net::HTTP.new(@uri.host, @uri.port)
        res = http.head(@uri.path)
        (200...300) === res.code.to_i
      end

      def retry_with(retry_count, &trial)
        trials = retry_count.downto(0)
        successes = trials.drop_while {|try_phase| !trial.call(try_phase) }
        successes.any? or raise CannotSucceedWithinRetriesError
      end
    end
  end
end

# Reopen the Endpoint to override params method to filter by
# defined params in params block
module Grape
  class Endpoint

    def params
      @params ||= @request.params.slice(*route.route_params.keys)
    end

  end
end

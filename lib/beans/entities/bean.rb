module Beans
  module Entities
    class Bean < Base
      attr_reader :name, :region, :country

      def initialize(name, region, country)
        @name = name
        @region = region
        @country = country
      end
    end
  end
end

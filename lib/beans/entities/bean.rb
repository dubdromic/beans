module Beans
  module Entities
    class Bean < Entities::Base
      attr_reader :name, :region, :country, :brand

      def initialize(name, region, country, brand)
        @name = name
        @region = region
        @country = country
        @brand = brand
      end
    end
  end
end

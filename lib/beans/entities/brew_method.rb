module Beans
  module Entities
    class BrewMethod < Entities::Base
      attr_reader :name

      def initialize(name)
        @name = name
      end
    end
  end
end

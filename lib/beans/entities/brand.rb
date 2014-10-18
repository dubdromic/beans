module Beans
  module Entities
    class Brand < Entities::Base
      attr_reader :name

      def initialize(name)
        @name = name
      end
    end
  end
end

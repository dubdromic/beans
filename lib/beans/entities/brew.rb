module Beans
  module Entities
    class Brew < Entities::Base
      attr_reader :method, :grind, :bloom_time, :pour_time

      def initialize(method, grind, bloom_time, pour_time)
        @method = method
        @grind = grind
        @bloom_time = bloom_time
        @pour_time = pour_time
      end
    end
  end
end

module Beans
  module Entities
    class Brew < Entities::Base
      attr_reader :bean, :method, :grind, :bloom_time, :pour_time

      def initialize(bean, method, grind, bloom_time, pour_time)
        @bean = bean
        @method = method
        @grind = grind
        @bloom_time = bloom_time
        @pour_time = pour_time
      end
    end
  end
end

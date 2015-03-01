module Beans
  module UseCases
    module Brew
      def add_brew(bean, method, grind, bloom_time = nil, pour_time = nil)
        BrewAdder.call(bean, method, grind, bloom_time, pour_time)
      end
    end
  end
end

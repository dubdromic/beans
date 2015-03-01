module Beans
  module UseCases
    module Brew
      class BrewAdder < UseCases::Base
        registry_type :brew

        def call(bean, method, grind, bloom_time, pour_time)
          repo.save Entities::Brew.new(bean, method, grind, bloom_time, pour_time)
        end
      end
    end
  end
end

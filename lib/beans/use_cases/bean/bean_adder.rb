module Beans
  module UseCases
    module Bean
      class BeanAdder < UseCases::Base
        registry_type :bean

        def call(name, region, country)
          repo.save Entities::Bean.new(name, region, country)
        end
      end
    end
  end
end

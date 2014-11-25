module Beans
  module UseCases
    module Brands
      class BrandAdder < UseCases::Base
        registry_type :brand

        def call(name)
          repo.save Entities::Brand.new(name)
        end
      end
    end
  end
end

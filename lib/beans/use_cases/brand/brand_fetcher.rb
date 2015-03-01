module Beans
  module UseCases
    module Brand
      class BrandFetcher < UseCases::Base
        registry_type :brand

        def call(id = nil)
          id ? repo.find(id) : repo.all
        end
      end
    end
  end
end

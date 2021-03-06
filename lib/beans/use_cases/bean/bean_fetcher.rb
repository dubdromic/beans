module Beans
  module UseCases
    module Bean
      class BeanFetcher < UseCases::Base
        registry_type :bean

        def call(id = nil)
          id ? repo.find(id) : repo.all
        end
      end
    end
  end
end

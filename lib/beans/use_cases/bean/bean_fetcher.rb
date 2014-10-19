module Beans
  module UseCases
    module Bean
      class BeanFetcher < UseCases::Base
        registry_type :bean

        def call
          repo.all
        end
      end
    end
  end
end

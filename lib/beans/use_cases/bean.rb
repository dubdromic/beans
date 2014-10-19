module Beans
  module UseCases
    module Bean
      def fetch_beans
        BeanFetcher.call
      end

      def add_bean(name, region, country, brand = nil)
        BeanAdder.call(name, region, country, brand)
      end
    end
  end
end

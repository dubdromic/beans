module Beans
  module UseCases
    module Bean
      def fetch_beans
        BeanFetcher.call
      end

      def add_bean(name, region, country)
        BeanAdder.call(name, region, country)
      end
    end
  end
end

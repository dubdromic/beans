module Beans
  module UseCases
    module Brand
      def add_brand(name)
        BrandAdder.call(name)
      end
    end
  end
end

module Beans
  module UseCases
    class Base
      def self.registry_type(type)
        @registry_type = type
      end

      def self.type
        @registry_type
      end

      def self.call(*args)
        new.call(*args)
      end

      private

      def repo
        Beans.repo.for(self.class.type)
      end
    end
  end
end

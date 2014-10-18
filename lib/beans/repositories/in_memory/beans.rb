module Beans
  module Repositories
    module InMemory
      class Beans
        def initialize
          @beans = {}
          @next_id = 1
        end

        def all
          beans.values
        end

        def find(id)
          beans[id]
        end

        def save(bean)
          bean.id = next_id
          @beans[bean.id] = bean
          @next_id += 1
          bean
        end

        private

        attr_reader :beans, :next_id
      end
    end
  end
end

module Beans
  module Repositories
    module InMemory
      class Base
        def initialize
          @items = {}
          @next_id = 1
        end

        def all
          items.values
        end

        def find(id)
          items[id]
        end

        def save(item)
          item.id = next_id
          @items[item.id] = item
          @next_id += 1
          item
        end

        def delete_all
          @items = {}
        end

        private

        attr_reader :items, :next_id
      end
    end
  end
end

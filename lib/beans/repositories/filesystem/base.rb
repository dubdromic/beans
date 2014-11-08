require 'yaml/store'

module Beans
  module Repositories
    module Filesystem
      class Base
        def self.filename=(filename)
          @filename = filename
        end

        def self.filename
          @filename
        end

        def initialize(filename = nil)
          @filename = filename || self.class.filename
        end

        def all
          store.transaction { items }
        end

        def find(id)
          store.transaction { item_by_id id }
        end

        def save(item)
          item.id = find_last_id + 1
          store.transaction do
            store[:items] ||= []
            store[:items] << item
          end
          item
        end

        private

        attr_reader :filename

        def find_last_id
          store.transaction do
            max_item = items.max_by(&:id)
            max_item ? max_item.id : 0
          end
        end

        def item_by_id(id)
          items.detect { |i| i.id == id }
        end

        def items
          store.fetch(:items, [])
        end

        def store
          @store ||= YAML::Store.new(filename)
        end
      end
    end
  end
end

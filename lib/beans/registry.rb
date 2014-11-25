Dir[File.dirname(__FILE__) + '/repositories/**/*.rb'].each { |f| require f }

module Beans
  class Registry
    attr_accessor :default

    def register(type, repo)
      repositories[type] = repo
    end

    def for(type)
      repositories.fetch(type) { default }
    end

    def reset
      @default = in_memory_repository
      repositories.each { |_, r| r.delete_all }
    end

    def repositories
      @repositories ||= {}
    end

    private

    def default
      @default ||= in_memory_repository
    end

    def in_memory_repository
      Repositories::InMemory::Base.new
    end
  end
end

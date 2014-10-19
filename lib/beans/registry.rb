Dir[File.dirname(__FILE__) + '/repositories/**/*.rb'].each { |f| require f }

module Beans
  class Registry
    def self.register(type, repo)
      repositories[type] = repo
    end

    def self.for(type)
      repositories.fetch(type) { default }
    end

    def self.repositories
      @repositories ||= {}
    end

    def self.default
      @default ||= Repositories::InMemory::Base.new
    end
  end
end

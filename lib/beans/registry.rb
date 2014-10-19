Dir[File.dirname(__FILE__) + '/repositories/**/*.rb'].each { |f| require f }

module Beans
  class Registry
    def register(type, repo)
      repositories[type] = repo
    end

    def for(type)
      repositories.fetch(type) { default }
    end

    def reset
      repositories.each { |_, r| r.delete_all }
    end

    def repositories
      @repositories ||= {}
    end

    private

    def default
      @default ||= Repositories::InMemory::Base.new
    end
  end
end

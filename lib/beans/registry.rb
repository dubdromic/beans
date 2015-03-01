Dir[File.dirname(__FILE__) + '/repositories/**/*.rb'].each { |f| require f }

module Beans
  class Registry
    attr_accessor :default

    def register(type, repo)
      repositories[type] = repo
    end

    def for(type)
      default_for(type) unless repositories.key?(type)
      repositories.fetch(type) { default_repository }
    end

    def reset
      @default = default_repository
      repositories.each { |_, r| r.delete_all }
    end

    def repositories
      @repositories ||= {}
    end

    private

    def default_for(type)
      register(type, default_repository)
    end

    def default_repository
      Repositories::InMemory::Base.new
    end
  end
end

require 'beans/repositories/in_memory/bean'

module Beans
  class Registry
    def self.register(type, repo)
      repositories[type] = repo
    end

    def self.for(type)
      repositories[type]
    end

    def self.repositories
      @repositories ||= {}
    end
  end
end

require 'beans/repositories/in_memory/beans'

module Beans
  class Repository
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

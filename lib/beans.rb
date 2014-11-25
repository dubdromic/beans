require 'beans/version'
require 'beans/registry'

Dir[File.dirname(__FILE__) + '/beans/entities/**/*.rb'].sort.each { |f| require f }
Dir[File.dirname(__FILE__) + '/beans/use_cases/**/*.rb'].sort.each { |f| require f }

module Beans
  extend UseCases::Bean
  extend UseCases::Brand

  class << self
    attr_accessor :repo, :use_cases

    def configure
      yield self
    end

    def register_repository(type, repository)
      repo.register type, repository
    end

    def default_store(store)
      repo.default = store
    end

    def repo
      @repo ||= Registry.new
    end
  end
end

require 'awesome_print'

require 'beans/version'
require 'beans/registry'

to_include = %w(/beans/entities/**/*.rb /beans/use_cases/**/*.rb)

to_include.each do |uri|
  Dir[File.dirname(__FILE__) + uri].sort.each { |f| require f }
end

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

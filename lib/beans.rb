require 'beans/version'
require 'beans/registry'

module Beans
  class << self
    attr_accessor :repo, :use_cases

    def configure
      yield self
    end

    def register_repository(type, repository)
      repo.register type, repository
    end

    def repo
      @repo ||= Registry
    end

    def add_use_case(use_case)
      use_cases << use_case
    end

    def method_missing(method_name, *args)
      use_case = use_cases.select { |uc| uc.respond_to?(method_name) }.first

      if use_case
        use_case.public_send(method_name, *args)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      responds = use_cases.select { |uc| uc.respond_to?(method_name) }.any?
      responds || super
    end

    def use_cases
      @use_cases ||= []
    end
  end
end

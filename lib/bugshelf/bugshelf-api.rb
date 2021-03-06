require 'active_support'
require 'active_resource'

module BugshelfAPI
  class Error < StandardError; end

  class << self

    # Sets up basic authentication credentials for all the resources.
    def authenticate(subdomain, api_key)
      @subdomain = subdomain

      development = ENV['BUGS_ENV'] == 'development'
      tld    = development ? 'dev'  : 'com'
      schema = development ? 'http' : 'https'

      self::Base.site = "#{schema}://#{api_key}:***@#{subdomain}.bugshelf.#{tld}/"
    end

    def resources
      @resources ||= []
    end
  end

  class Base < ActiveResource::Base
    self.format = :xml
    if ENV['http_proxy']
      self.proxy = ENV['http_proxy']
    end

    def self.inherited(base)
      BugshelfAPI.resources << base
      super
    end

    def self.build_subclass
      Class.new(self).tap do |c|
        c.element_name    = self.element_name
        c.collection_name = self.collection_name
        c.primary_key     = self.primary_key
      end
    end
  end

  class Project < Base
    def issues
      Issue.build_subclass.tap do |issue|
        issue.prefix = "/projects/#{self.project_key}/"
      end
    end
  end

  class Issue < Base
    self.prefix = "/projects/:project_id/"
  end
end
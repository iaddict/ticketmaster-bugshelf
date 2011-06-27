module TicketMaster::Provider
  # This is the Bugshelf Provider for ticketmaster
  module Bugshelf
    include TicketMaster::Provider::Base
    TICKET_API = Bugshelf::Ticket # The class to access the api's tickets
    PROJECT_API = Bugshelf::Project # The class to access the api's projects
    
    # This is for cases when you want to instantiate using TicketMaster::Provider::Bugshelf.new(auth)
    def self.new(auth = {})
      TicketMaster.new(:bugshelf, auth)
    end
    
    # Authorize with subdomain and api_key, eg.: Bugshelf::authorize(:subdomain => 'subforcompany', :api_key => 'szgduztad7asdtuzagdgkasdgf)
    def authorize(auth = {})
      @authentication ||= TicketMaster::Authenticator.new(auth)
      auth = @authentication

      if auth.subdomain.blank? or auth.api_key.blank?
        raise "Please provide at least a set of subdomain and api_key)"
      end
      ::BugshelfAPI.authenticate(auth.subdomain, auth.api_key)
    end
    
    def valid?
      begin
        PROJECT_API.find(:first).nil?
        true
      rescue
        false
      end
    end
    
  end
end



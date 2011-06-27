module TicketMaster::Provider
  module Bugshelf
    # Ticket class for ticketmaster-bugshelf
    #
    
    class Ticket < TicketMaster::Provider::Base::Ticket
      API = BugshelfAPI::Ticket # The class to access the api's tickets
      # declare needed overloaded methods here
      
    end
  end
end

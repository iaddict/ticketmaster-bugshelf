module TicketMaster::Provider
  module Bugshelf
    # Ticket class for ticketmaster-bugshelf
    #
    
    class Ticket < TicketMaster::Provider::Base::Ticket
      API = BugshelfAPI::Issue # The class to access the api's tickets

      def self.search(project_id, options = {}, limit = 1000)
       tickets = API.find(:all, :params => {:project_id => project_id, :per_page => limit})
       search_by_attribute(tickets, options, limit)
      end

      def self.create(*options)
        if options.first.is_a? Hash
          options.first.merge!(
            :details => options.first.delete(:description)
          )
          task = API.new(options.first)
          ticket = self.new task
          task.save
          ticket
        end
      end

      def destroy(*options)
        @system_data[:client].destroy.is_a?(Net::HTTPOK)
      end

      def id
        @system_data[:client].string_id
      end

      def description
        self.details
      end
    end
  end
end

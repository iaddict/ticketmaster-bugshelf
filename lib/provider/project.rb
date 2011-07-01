module TicketMaster::Provider
  module Bugshelf
    # Project class for ticketmaster-bugshelf
    #
    #
    class Project < TicketMaster::Provider::Base::Project
      API = BugshelfAPI::Project # The class to access the api's projects

      # copy from this.copy(that) copies that into this
      def copy(project)
        project.tickets.each do |ticket|
          copy_ticket = self.ticket!(:title => ticket.title, :description => ticket.description)
          ticket.comments.each do |comment|
            copy_ticket.comment!(:body => comment.body)
            sleep 1
          end
        end
      end

    end
  end
end



# ticketmaster-bugshelf

This is a provider for [ticketmaster](http://ticketrb.com). It provides interoperability with [Bugshelf](http://www.bugshelf.com/) through the ticketmaster gem.

# Usage and Examples

First we have to instantiate a new ticketmaster instance:

    bugshelf = TicketMaster.new(:bugshelf, {:subdomain => "rails", :api_key => "5ff546af3df4a3c02d3a734b0ff1c4fcc5351c56"})

Pass in :subdomain and :api_key to access your bugshelf.
The api_key allows access to a specific account without having to give out your login credentials.

== Finding Projects

    project = bugshelf.project.find(42)

== Finding Tickets

    tickets = project.tickets
    ticket  = project.tickets 'BSF-042'
    

## Requirements

* rubygems (obviously)
* ticketmaster gem (latest version preferred)

The ticketmaster gem should automatically be installed during the installation of this gem if it is not already installed.

## Other Notes

Since this and the ticketmaster gem is still primarily a work-in-progress, minor changes may be incompatible with previous versions. Please be careful about using and updating this gem in production.

If you see or find any issues, feel free to open up an issue report.


## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2011 Shelf Cloud. See LICENSE for details.
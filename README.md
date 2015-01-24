CURL UP 'N' DYE HAIR SALON

APPLICATION DESCRIPTION

The Curl Up 'N' Dye Hair Salon web application helps the boss of the salon keep track of her stylists and their clients.  It uses a psql database "Salon", in which two tables, "Stylists" and "Clients" keeps track of the names of both Stylists and Clients.  These tables talk to each other through the client column "stylist_id", a method that pulls the primary id of each Stylist and drops it into a column for the clients.

The web application allows the user to add new Stylists, add clients to individual stylists with a select list, and terminate Stylists. It has yet to understand how to terminate individual clients, although the method is there in the client.rb file, and the spec for the method passes.

This now needs the front end styling work.  To be added soon.

"Curl Up And Dye" a Blues Brothers joke, which is the license as well.

Copyright 2015 James K Maynard

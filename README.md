# BixiFinder
An app to help find which BIXI stations still have available bikes near you.


# README

This app was developped and tested on a Macbook pro with macOS Sierra 10.12.4 (16E195)

Requirements
-------------

	Rails 5.1.0
	Gem 2.6.12
	Ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin16]


It uses the BIXI API from open data Montreal:

	http://donnees.ville.montreal.qc.ca/dataset/bixi-etat-des-stations

It also uses the Geocoder gem to measure the distances between the stations:

	https://github.com/alexreisner/geocoder

Default origin location is:
 
	Latitude: 45.506318
	Longitude: -73.569021

	You can modifiy this in /config/initializers/geo_locations.rb


Installation
------------

Clone the code to your machine then run these command:

	bundle install
	rails db:migrate
	rails server

Point your browser to:

	http://localhost:3000

> NOTE:
> The first page loading may take a while because the database
> is being populated with data from the Montreal bixi dataset.
> After the initializing process in complete, 
> you should see a net increase in responsivity at page reloads.
> An occasional slow down is possible when the app detects a change
> to the Montreal bixi dataset and updates the local database accordingly.
 

Enjoy!


![alt text](https://cloud.githubusercontent.com/assets/44904/26007283/c8940638-370d-11e7-97ff-7aa16a91cba0.png)


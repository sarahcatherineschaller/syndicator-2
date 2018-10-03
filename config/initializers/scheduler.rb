require 'uri'
require 'rufus-scheduler'
require 'net/http'
require 'net/https'

scheduler = Rufus::Scheduler.new 

scheduler.every '1h' do 
	@events = Event.all 
	@events.each do |event|
		if event.new_record?

			#Yelp
			uri = URI.parse("https://www.yelp.com/events/create")
			https = Net::HTTP.new(uri.host, uri.port)
			https.use_ssl = true 

			req = Net::HTTP::Post.new(uri.path)

			req['Event Name'] = event.name 
			req['When'] = event.date 
			req['What & Why'] = event.description 
			req['Business Name'] = event.venue 
			req['Price'] = event.price 

			res = https.request(req)

			puts "Yelp - Response #{res.code} #{res.message}: #{res.body}"


			#Eventbrite
			uri = URI.parse("https://www.eventbrite.com/create")
			https = Net::HTTP.new(uri.host, uri.port)
			https.use_ssl = true 

			req = Net::HTTP::Post.new(uri.path)

			req['Event Title'] = event.name 
			req['Location'] = event.venue 
			req['Starts'] = event.date 
			req['Event Description'] = event.description 

			res = https.request(req)

			puts "Eventbrite - Response #{res.code} #{res.message}: #{res.body}"


			#Eventseeker
			uri = URI.parse("https://eventseeker.com/new-york/ugc-e")
			https = Net::HTTP.new(uri.host, uri.port)
			https.use_ssl = true 

			req = Net::HTTP::Post.new(uri.path)

			req['Event Name'] = event.name 
			req['Category'] = "Community"
			req['Start Date'] = event.date 
			req['Select City'] = "New York"
			req['Venue Name'] = event.venue
			req['Price'] = event.price 
			req['Event Description'] = event.description

			res = https.request(req)

			puts "Eventseeker - Response #{res.code} #{res.message}: #{res.body}"


			#Gary's Guide
			uri = URI.parse("https://www.garysguide.com/events/new?region=newyork")
			https = Net::HTTP.new(uri.host, uri.port)
			https.use_ssl = true 

			req = Net::HTTP::Post.new(uri.path)

			req['Title'] = event.name 
			req['Description'] = event.description 
			req['Start Date'] = event.date 
			req['Cost'] = event.price 

			res = https.request(req)

			puts "Gary's Guide - Response #{res.code} #{res.message}: #{res.body}"

			
			#Event Crazy
			uri = URI.parse("https://www.eventcrazy.com/event/submit.cfm")
			https = Net::HTTP.new(uri.host, uri.port)
			https.use_ssl = true 

			req = Net::HTTP::Post.new(uri.path)

			req['Location Name'] = event.venue 
			req['Event Name'] = event.name 
			req['Open Date'] = event.date 
			req['Description'] = event.description 

			res = https.request(req)

			puts "Event Crazy - Response #{res.code} #{res.message}: #{res.body}"
		end 
	end
end
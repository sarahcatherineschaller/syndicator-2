require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new 

scheduler.every '1h' do 
	@events = Event.all 
	@events.each do |event|
		if event.new_record?

		end
	end 
end
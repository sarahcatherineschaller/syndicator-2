class EventsController < ApplicationController 
	def index 
	end 

	def show 
		@
	end 

	def new 
		@user = current_user 
		@event = Event.new
	end 

	def create
		@event = Event.new(event_params)
		@user = current_user 
		@event.user_id = @user.id 
		@event.save 

		render 'events/show'
	end 

	def edit
	end 

	def update 
	end 

	def destroy 
	end

	private 
	def event_params
		params.require(:event).permit(:name, :date, :price, :venue, :description, :user_id)
	end 


end
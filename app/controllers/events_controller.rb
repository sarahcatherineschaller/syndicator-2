class EventsController < ApplicationController 
	def index 
		@events = Event.all
		@user = current_user
	end 

	def show 
		@event = Event.find(params[:id])
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

		redirect_to user_event_path(@user.id, @event.id)
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
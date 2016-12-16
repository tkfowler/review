class EventsController < ApplicationController
  before_action :require_login
  before_action :require_correct_user, only: [:destroy]
  def index
    @your_events = Event.where(state: current_user.state)
    @events = Event.where.not(state: current_user.state)
  end

  def show
    @event = Event.find(params[:id])
    @comments = Comment.where(event: @event)
  end

  def create
    @event = Event.create( event_params )
    if @event.valid?
      redirect_to '/events'
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to '/events'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.update(params[:id], event_params)
    if @event.valid?
      redirect_to '/events'
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to "/events/#{params[:id]}/edit"
    end
  end

  def destroy
    @event = Event.find(params[:id]).destroy
    redirect_to '/events'
  end

  private
  def event_params
    params.require(:event).permit(:name, :date, :city, :state, :user_id)
  end
end

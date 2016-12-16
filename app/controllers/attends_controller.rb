class AttendsController < ApplicationController
  def join
    Attend.create(user_id:current_user.id, event_id:params[:id])
    redirect_to '/events'
  end

  def cancel
    @attend = Attend.find_by(user_id:current_user.id, event_id:params[:id])
    @attend.destroy
    redirect_to '/events'
  end
end

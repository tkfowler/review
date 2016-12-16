class CommentsController < ApplicationController
  def create
    @comment = Comment.create(content:params[:content], user_id:current_user.id, event_id:params[:event_id] )
    if @comment.valid?
      redirect_to "/events/#{params[:event_id]}"
    else
      flash[:error] = @comment.errors.full_messages
    end
  end
end

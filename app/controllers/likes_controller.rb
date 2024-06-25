class LikesController < ApplicationController

  before_action :authenticate_user!

  def toggle_like_dislike
    like = current_user.likes.find_by(likeable_type: params[:likeable_type], likeable_id: params[:likeable_id])
    if like
      like.destroy
      status = 'disliked'
    else
      current_user.likes.create(likeable_type: params[:likeable_type], likeable_id: params[:likeable_id])
      status = 'liked'
    end

    render json: { status: status }
  end

  # def create
  #   current_user.likes.create(likeable_type: params[:likeable_type], likeable_id: params[:likeable_id])
  #   head :ok
  # end

  # def destroy
  #   like = current_user.likes.find_by(likeable_type: params[:likeable_type], likeable_id: params[:likeable_id])
  #   like.destroy
  #   head :ok
  # end

end

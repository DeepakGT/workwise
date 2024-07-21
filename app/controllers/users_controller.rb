class UsersController < ApplicationController

  before_action :authenticate_user!

  def my_profile; end

  def update_pictures
    if params[:profile_picture].present?
      current_user.profile_picture.attach(params[:profile_picture])
      if current_user.save
        render json: { success: true, url: url_for(current_user.profile_picture) }
      else
        render json: { success: false }
      end
    elsif params[:profile_picture_banner].present?
      current_user.profile_picture_banner.attach(params[:profile_picture_banner])
      if current_user.save
        render json: { success: true, url: url_for(current_user.profile_picture_banner) }
      else
        render json: { success: false }
      end
    else
      render json: { success: false }
    end
  end
end





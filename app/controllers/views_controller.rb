class ViewsController < ApplicationController

  def create
    current_user.views.create(viewable_type: params[:viewable_type].classify, viewable_id: params[:viewable_id])
  end

end

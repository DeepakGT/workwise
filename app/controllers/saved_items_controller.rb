class SavedItemsController < ApplicationController

  before_action :authenticate_user!

  def create
    current_user.saved_items.create(item_type: params[:item_type].classify, item_id: params[:item_id])
  end

  def delete
    SavedItem.find(params[:id]).delete
  end

end

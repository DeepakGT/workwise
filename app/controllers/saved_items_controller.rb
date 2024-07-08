class SavedItemsController < ApplicationController

  before_action :authenticate_user!

  def toggle
    @meta_data = {}
    @saved_item = current_user.saved_items.find_by(item_type: params[:item_type].classify, item_id: params[:item_id])
    if @saved_item
      @meta_data['saved_item_type'] = @saved_item.item_type
      @meta_data['saved_item_id'] = @saved_item.id
      @meta_data['operation'] = 'delete'
      @saved_item.delete
    else
      @saved_item = current_user.saved_items.create(item_type: params[:item_type].classify, item_id: params[:item_id])
      @meta_data['operation'] = 'create'
    end
  end

end

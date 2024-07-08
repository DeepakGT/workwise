module ApplicationHelper
  def my_saved_item?(item_type, item_id)
    return false unless current_user

    current_user.saved_items.find_by(item_type: item_type.classify, item_id: item_id).present?
  end
end

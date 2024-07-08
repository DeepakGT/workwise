module ProjectsHelper
  def my_saved_project?(project_id)
    return false unless current_user

    current_user.saved_items.find_by(item_type: 'Project', item_id: project_id).present?
  end
end

module ProjectsHelper
  def my_saved_project?(project_id)
    return false unless current_user

    current_user.saved_projects.exists?(project_id)
  end
end

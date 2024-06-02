module ProjectsHelper
  def my_saved_project?(project_id)
    current_user.saved_projects.exists?(project_id)
  end
end

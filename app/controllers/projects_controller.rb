class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    ActiveRecord::Base.transaction do
      @skills = create_skills
      @project = Project.create(project_params)
      assign_skills
    end
  end

  private

  def create_skills
    skills_parameters.map do |skill_title|
      Skill.find_or_create_by(title: skill_title)
    end
  end

  def assign_skills
    @project.skills << @skills
  end

  def project_params
    params.require(:project).permit(:title, :category_id, :price_per_hour, :description)
  end

  def skills_parameters
    params.dig(:project, :skills).reject(&:blank?)
  end

end

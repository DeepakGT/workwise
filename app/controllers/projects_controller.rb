class ProjectsController < ApplicationController

  def index
  end

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
    params.require(:project).permit(:title, :category_id, :min_per_hour_price, :max_per_hour_price, :min_total_price, :max_total_price, :description)
  end

  def skills_parameters
    params.dig(:project, :skills).reject(&:blank?)
  end

end

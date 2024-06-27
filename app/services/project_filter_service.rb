module ProjectFilterService
  class << self
    def call(q, filters, projects)
      return projects if q.blank? && filters.blank?

      process(q, filters, projects)
    end

    private

    def process(q, filters, projects)
      projects = filter_by_search_keyword(q, projects) if q.present?
      projects = filter_by_filters(filters, projects) if filters.present?
      projects
    end

    def filter_by_search_keyword(q, projects)
      projects.where('title LIKE ? OR description LIKE ?', "%#{q}%", "%#{q}%")
    end

    def filter_by_filters(filters, projects)
      filters.each do |key, value|
        case key
        when 'skills'
          projects = projects.joins(:skills).where(skills: { id: value })
        when 'client_rating'
          projects = projects.where(client_rating: value)
        when 'categories'
          projects = projects.joins(:category).where(category: { id: value })
        when 'pay_rate'
          min_rate, max_rate = value.split(',')
          projects = projects.where('pay_rate >= ? AND pay_rate <= ?', min_rate, max_rate)
        when 'countries'
          projects = projects.where(country: value)
        end
      end
      projects
    end

    # Additional methods for filtering by associations
    def filter_by_skills(skill_ids, projects)
      projects.joins(:skills).where(skills: { id: skill_ids })
    end

    def filter_by_categories(category_ids, projects)
      projects.joins(:category).where(category: { id: category_ids })
    end
  end
end

categories = ['software', 'data entry']
categories.each do |val|
  Category.find_or_create_by(title: val)
end


job_categories = [
  "Information Technology",
  "Healthcare",
  "Finance",
  "Education",
  "Engineering",
  "Marketing",
  "Sales",
  "Human Resources",
  "Arts and Entertainment",
  "Hospitality and Travel",
  "Construction",
  "Legal",
  "Manufacturing",
  "Transportation and Logistics",
  "Administrative",
  "Science and Research",
  "Retail",
  "Nonprofit and Social Services",
  "Real Estate",
  "Telecommunications"
]

job_categories.each do |category|
  JobCategory.create(title: category.downcase)
end


JobCategory.all.each do |category|
  2.times do |i|
    Job.create(
      title: "Sample Job #{i + 1} in #{category}",
      job_category_id: category.id,
      hourly_price: rand(15..50),
      monthly_salary: rand(3000..7000),
      experience: "#{rand(1..5)} years",
      job_type: Job.job_types.keys.sample,
      description: "This is a sample job description for #{category} category.",
      uploader_id: User.first.id # Assuming the first user is the uploader; adjust as necessary
    )
  end
end

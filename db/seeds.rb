categories = ['software', 'data entry']
categories.each do |val|
  Category.find_or_create_by(title: val)
end

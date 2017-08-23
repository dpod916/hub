load 'config/environment.rb'
Rails.application.eager_load!

def bad_column(col, model)
	col.nil? || model.classify.constantize.column_names.exclude?(col) ? true : false
end

models = ["employee"]
models.each do |model|
	s = SimpleSpreadsheet::Workbook.read("data/#{model.pluralize}.xlsx")
	s.selected_sheet = s.sheets.first
	attribute_params = Hash.new
	s.first_row.upto(s.last_row) do |line|
		if line > 1
			s.first_column.upto(s.last_column) do |column|
				unless bad_column(s.cell(1, column), model)
				  attribute_params[s.cell(1, column).downcase.to_sym] = s.cell(line, column)
				end
			end
			new_model = model.classify.constantize.where(id: attribute_params[:id]).first_or_initialize
			new_model.update_attributes(attribute_params)
		end
		puts "#{model} #{line} of #{s.last_row}"
	end
end

# x = User.all.count
# i = 0
# User.all.each do |user|
# 	i+=1
# 	models = ["office", "function", "division", "profit_center", "department", "business_unit"]
#     models.each do |relationship|
#     	relationship_name = relationship
#     	relationship_name = "location" if relationship == "office"
#     	relationship_name = "cost_center" if relationship == "profit_center"
#     	r = relationship.classify.constantize.where(name: user.employee[relationship_name)).first_or_initialize
#     	user["#{relationship}_id".to_sym] = r.id
#     	user.save
#     	puts "updated #{relationship} for user #{i} of #{x}"
#     end
# end


# groups = ["office", "function", "division", "profit_center", "department", "business_unit", "operating_company"]
# groups.each do |model|
#     model_class = model.classify.constantize
#     x = model_class.all.count
#     i = 0
#     model_class.all.each do |m|
#         i+=1
#         profile = m.profile.nil? ? Profile.create(name: m.name, profilable: m) : m.profile.update_attributes(name: m.name)
# 	    puts "updated profile for #{model} #{i} of #{x}"
# 	end
# end


# User.all.each do |user|
#     user.update_attributes(name: user.profile.name, title: user.profile.title)
#     puts user.id
# end

# Training.all.each do |user|
#     user.update_attributes(name: user.profile.name, title: user.profile.title)
# end


# s = SimpleSpreadsheet::Workbook.read("data/segments_departments.xlsx")
# s.sheets.each do |sheet|
#     s.selected_sheet = sheet
#     s.first_row.upto(s.last_row) do |line|
#     	if line > 1
#     	    m1 = s.cell(1, 1).downcase.classify.constantize
#     	    m2 = s.cell(1, 2).downcase.classify.constantize
#     	    m3 = s.cell(1, 3).downcase.classify.constantize
#     	    c1 = m1.where(name: s.cell(line, 1)).first_or_initialize
#     	    c1.update_attributes(name: s.cell(line, 1))
#     	    p1 = c1.profile.nil? ? Profile.create(name: c1.name, profilable: c1) : c1.profile
#     	    c2 = m2.where(name: s.cell(line, 2)).first_or_initialize
#     	    c2.update_attributes(name: s.cell(line, 2))
#     	    p2 = c2.profile.nil? ? Profile.create(name: c2.name, profilable: c2) : c2.profile
#     	    c3 = m3.where(name: s.cell(line, 3)).first_or_initialize
#     	    c3.update_attributes(name: s.cell(line, 3))
#     	    c3["#{s.cell(1, 1).underscore.downcase}_id".to_sym] = c1.id
#     	    c3["#{s.cell(1, 2).underscore.downcase}_id".to_sym] = c2.id
#     	    c3.save
#     	    p3 = c3.profile.nil? ? Profile.create(name: c3.name, profilable: c3) : c3.profile
#     	end
#     	puts line
#     end
# end

# def time_rand from = 0.0, to = Time.now
#     Time.at(from + rand * (to.to_f - from.to_f))
# end

# Task.destroy_all
# @matter = Matter.last
# i = 0
# until i > 30 do
#   i+=1
#   start = time_rand Time.local(2017, 7, 2)
#   due = time_rand start, Time.local(2018, 12, 31)
#   @title = BetterLorem.w                  # -> Generate and return 20 words
#   @description = BetterLorem.p(10, true, true ) # -> Generate and return 10 paragraphs, in plain text (no HTML tags), excluding the trailing period.
#   @name = BetterLorem.c(100)
#   @task = Task.create(taskable: @matter, start_date: start,
#                       due_date: due, status_id: 1 + rand(5),
#                       priority_id: 1 + rand(3), name: @name,
#                       title: @title, description: @description)
#   @profile = Profile.create(profilable: @task, name: @name,
#                       title: @title, description: @description )
# end


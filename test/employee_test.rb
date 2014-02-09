require_relative "../lib/employee"

employee = Employee.new

########

puts "testing #male?"

employee.gender = 'M'
raise "#male? should be true when gender is 'M'" unless employee.male?

employee.gender = 'F'
raise "#male? should be false when gender is 'F'" unless !employee.male?

########

puts "testing #female?"

employee.gender = 'M'
raise "#female? should be false when gender is 'M'" unless !employee.female?

employee.gender = 'F'
raise "#female? should be true when gender is 'F'" unless employee.female?

########

puts "testing #full_name"

employee.first_name = 'Bob'
employee.last_name = 'Smith'
raise "#full_name? should combine first and last name" unless employee.full_name == 'Bob Smith'

employee.first_name = 'Bob'
employee.last_name = nil
raise "#full_name? should only use first when last is unavailable" unless employee.full_name == 'Bob'

employee.first_name = nil
employee.last_name = 'Smith'
raise "#full_name? should only use last when first is unavailable" unless employee.full_name == 'Smith'

puts "SUCCESS!"
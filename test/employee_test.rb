require_relative "../lib/employee"

employee = Employee.new

puts "testing #male?"

employee.gender = 'M'
raise "#male? should be true when gender is 'M'" unless employee.male?

employee.gender = 'F'
raise "#male? should be false when gender is 'F'" unless !employee.male?

puts "testing #female?"

employee.gender = 'M'
raise "#female? should be false when gender is 'M'" unless !employee.female?

employee.gender = 'F'
raise "#female? should be true when gender is 'F'" unless employee.female?

puts "SUCCESS!"
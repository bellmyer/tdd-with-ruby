require_relative "../lib/employee"

def describe label
  @label = label
  yield
end

def assert message
  employee = Employee.new
  raise "\n\n#{@label} #{message}" unless yield(employee)
  
  $stdout.print '.'; $stdout.flush
end

describe "#male?" do
  assert "should be true when gender is 'M'" do |employee|
    employee.gender = 'M'
    employee.male?
  end

  assert "should be false when gender is 'F'" do |employee|
    employee.gender = 'F'
    !employee.male?
  end
end

describe "#female?" do
  assert "should be false when gender is 'M'" do |employee|
    employee.gender = 'M'
    !employee.female?
  end

  assert "should be true when gender is 'F'" do |employee|
    employee.gender = 'F'
    employee.female?
  end
end

describe "#full_name" do
  assert "should combine first and last name" do |employee| 
    employee.first_name = 'Bob'
    employee.last_name = 'Smith'
  
    employee.full_name == 'Bob Smith'
  end

  assert "should only use first when last is unavailable" do |employee|
    employee.first_name = 'Bob'
    employee.full_name == 'Bob'
  end

  assert "should only use last when first is unavailable" do |employee|
    employee.last_name = 'Smith'
    employee.full_name == 'Smith'
  end
end

puts "\n\nSUCCESS!"
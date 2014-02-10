require_relative "../lib/employee"

def describe label, subject
  @label = label
  @subject = subject
  
  yield
end

def assert condition, expected_result
  employee = Employee.new
  
  yield(employee)
  actual_result = @subject.call(employee)
  
  if actual_result == expected_result
    $stdout.print '.'
    $stdout.flush
  else
    raise "\n\n#{condition}: #{@label} should be #{expected_result}, but was #{actual_result}"
  end
end

describe("#male?", lambda{|e| e.male?}) do
  assert("when gender is 'M'", true) do |employee|
    employee.gender = 'M'
  end

  assert("when gender is 'F'", false) do |employee|
    employee.gender = 'F'
  end
end

describe("#female?", lambda{|e| e.female?}) do
  assert("when gender is 'M'", false) do |employee|
    employee.gender = 'M'
  end

  assert("when gender is 'F'", true) do |employee|
    employee.gender = 'F'
  end
end

describe("#full_name", lambda{|e| e.full_name}) do
  assert("when first and last name are specified", 'Bob Smith') do |employee| 
    employee.first_name = 'Bob'
    employee.last_name = 'Smith'
  end

  assert("when last name is unavailable", 'Bob') do |employee|
    employee.first_name = 'Bob'
  end

  assert("when first name is unavailable", 'Smith') do |employee|
    employee.last_name = 'Smith'
  end
end

puts "\n\nSUCCESS!"
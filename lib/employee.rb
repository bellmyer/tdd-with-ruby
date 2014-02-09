class Employee
  attr_accessor :gender, :first_name, :last_name
  
  def initialize options={}
    @gender = options[:gender]
    @first_name = options[:first_name]
    @last_name = options[:last_name]
  end
  
  def male?
    gender == 'M'
  end
  
  def female?
    gender == 'F'
  end
  
  def full_name
    [first_name, last_name].join(' ').strip
  end
end
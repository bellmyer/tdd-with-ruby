class Employee
  attr_accessor :gender
  
  def initialize options={}
    @gender = options[:gender]
  end
  
  def male?
    gender == 'M'
  end
  
  def female?
    gender == 'F'
  end
end
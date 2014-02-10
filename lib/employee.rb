require 'date'

class Employee
  attr_accessor :gender, :first_name, :last_name, :dob
  
  def initialize options={}
    @gender = options[:gender]
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @dob = Date.parse(options[:dob]) if options[:dob]
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
  
  def age
    return nil if dob.nil?
    
    today = Date.today
    
    years = today.year - dob.year
    years -= 1 if today.yday < dob.yday
    
    years
  end
end
require_relative "../lib/employee"

describe Employee do  
  describe "#male?" do
    subject { Employee.new(:gender => gender).male? }
    
    describe "when gender is male" do
      let(:gender) { 'M' }
      it { should == true }
    end
    
    describe "when gender is female" do
      let(:gender) { 'F' }
      it { should == false}
    end
    
    describe "when gender is unspecified" do
      let(:gender) { nil }
      it { should == false}
    end
  end
  
  describe "#female?" do
    subject { Employee.new(:gender => gender).female? }
    
    describe "when gender is male" do
      let(:gender) { 'M' }
      it { should == false }
    end
    
    describe "when gender is female" do
      let(:gender) { 'F' }
      it { should == true}
    end
    
    describe "when gender is unspecified" do
      let(:gender) { nil }
      it { should == false}
    end
  end
  
  describe "#full_name" do
    subject { Employee.new(:first_name => first_name, :last_name => last_name).full_name }
    
    describe "when first and last name are specified" do
      let(:first_name) { 'Bob' }
      let(:last_name) { 'Smith' }
      
      it { should == 'Bob Smith' }
    end
    
    describe "when first name is unspecified" do
      let(:first_name) { nil }
      let(:last_name) { 'Smith' }
      
      it { should == 'Smith' }
    end

    describe "when last name is unspecified" do
      let(:first_name) { 'Bob' }
      let(:last_name) { nil }
      
      it { should == 'Bob' }
    end
  end
  
  describe "#age" do
    subject { Employee.new(:dob => dob).age }
    
    before do
      today = Date.parse('2014-01-01')
      Date.stub(:today).and_return(today)
    end
    
    describe "when dob is properly set" do
      let(:dob) { '1977-04-29' }
      
      it { should be_a(Fixnum) }
      it { should == 36 }
    end
    
    describe "when birthday is today" do
      let(:dob) { '1977-01-01' }
      
      it { should be_a(Fixnum) }
      it { should = 37 }
    end
    
    describe "when dob is not set" do
      let(:dob) { nil }
      it { should be_nil }
    end
  end
end
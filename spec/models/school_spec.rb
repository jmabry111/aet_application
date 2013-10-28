require 'spec_helper'

describe School do
  before { @school = School.new(name: "Example High School") }
  
  subject { @school }
  
  it { should respond_to(:name) }
  
  it { should be_valid }
  describe "when school is not present" do
  before { @school.name = " " }
    it { should_not be_valid }
  end
  describe "when schoolname is too long" do
  before { @school.name = "a"*51 }
    it { should_not be_valid }
  end
  
end

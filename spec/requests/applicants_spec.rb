require 'spec_helper'

describe "Applicants" do
  
  subject {page}
  
 
  describe "New Applicant Form" do
    applicant = FactoryGirl.build(:applicant)
    it "should have the content 'Enter applicant information'" do
      visit '/applicants/new'
      page.should have_content('Enter applicant information')
    end
  end  
  
end

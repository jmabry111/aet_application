require 'spec_helper'

describe "application" do

  context "missing required information" do
    it "will show that the form has errors" do
      visit new_applicant_path
      click_button "Submit my information"

      page.should have_content("The form contains")
      page.should have_content("errors")
      Applicant.count.should eq 0
    end
  end

  def fill_in_required_information(email)
    select("Beverly High School", from: "School")
    fill_in("First Name", with: "Peter")
    fill_in("Last Name", with: "Parker")
    choose("11")
    fill_in("Parent/Guardian First Name", with: "Aunt")
    fill_in("Parent/Guardian Last Name", with: "Mae")
    fill_in("Home Phone", with: "222-222-2222")
    fill_in("Work Phone", with: "111-111-1111")
    fill_in("Email", with: email)
    fill_in("Math", with: "Mrs Smith")
    fill_in("Email", with:"doc@doc.com")
    fill_in("Science", with: "Doc Oc")
    fill_in("Email", with:"doc@doc.com")
    fill_in("English", with: "Another One")
    fill_in("Email", with:"doc@doc.com")
    fill_in("Street Address", with: "12 Main St.")
    fill_in("City", with:"MVILLE")
    fill_in("State", with:"VA")
    fill_in("5 Digit Zip Code", with:"24112")
    choose("Engineering")
  end
end

require 'spec_helper'

  feature 'applicant_applies' do
    scenario 'without_errors' do
      School.create(name: "Beverly High School")
      visit "root"
      click_link "Begin Application Process"
      page.should have_content "Mission Statement"
      click_link "Continue"
      page.should have_content "How to apply"
      click_link "Continue"
      page.should have_content "Application Process"
      click_link "Begin Application"
      page.should have_content "Enter applicant information"

      select "Beverly High School", :from => "School"
      fill_in "First Name", with: "Jethro"
      fill_in "Last Name", with: "Clampett"
      choose "Male"
      choose "12"
      fill_in "Parent/Guardian First Name", with: "Jed"
      fill_in "Parent/Guardian Last Name", with: "Clampett"
      fill_in "Parent Street Address", with: "12 Beverly Way"
      fill_in "City", with: "Beverly Hills"
      fill_in "State", with: "CA"
      fill_in "5 Digit Zip Code", with: "90210"
      fill_in "Parent Home Phone", with: "555-765-0987"
      fill_in "Parent Work Phone", with: "555-555-1212"
      fill_in "Math:", with: "Ms. Granny"
      fill_in "Science", with: "Mr. Drysdale"
      fill_in "English", with: "Miss Jane"
      check "Teachers Contacted"
      check "Applicant confirmation"
      check "Parent confirmation"
      click_button "Submit my information"
      page.should have_content ("Information was successfully submitted")
    end

    scenario 'with_invisible_captcha_filled_in' do
      School.create(name: "Beverly High School")
      visit "root"
      click_link "Begin Application Process"
      page.should have_content "Mission Statement"
      click_link "Continue"
      page.should have_content "How to apply"
      click_link "Continue"
      page.should have_content "Application Process"
      click_link "Begin Application"
      page.should have_content "Enter applicant information"

      select "Beverly High School", :from => "School"
      fill_in "If you are a human, ignore this field", with: "I'm a bot"
      fill_in "First Name", with: "Jethro"
      fill_in "Last Name", with: "Clampett"
      choose "Male"
      choose "12"
      fill_in "Parent/Guardian First Name", with: "Jed"
      fill_in "Parent/Guardian Last Name", with: "Clampett"
      fill_in "Parent Street Address", with: "12 Beverly Way"
      fill_in "City", with: "Beverly Hills"
      fill_in "State", with: "CA"
      fill_in "5 Digit Zip Code", with: "90210"
      fill_in "Parent Home Phone", with: "555-765-0987"
      fill_in "Parent Work Phone", with: "555-555-1212"
      fill_in "Math:", with: "Ms. Granny"
      fill_in "Science", with: "Mr. Drysdale"
      fill_in "English", with: "Miss Jane"
      check "Teachers Contacted"
      check "Applicant confirmation"
      check "Parent confirmation"
      click_button "Submit my information"
      page.should have_content ("Information was successfully submitted")
    end
  end

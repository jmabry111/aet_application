require 'spec_helper'

describe Applicant do
  describe "#strip_extra_characters" do
    it "removes extra characters from the phone numbers" do
      applicant = FactoryGirl.build(:applicant,
                                    home_phone: "222-222-2222",
                                    work_phone: "333-333-3333",
                                    school_phone: "444-444-4444")
      applicant.strip_extra_characters

      applicant.home_phone.should eq "2222222222"
      applicant.work_phone.should eq "3333333333"
      applicant.school_phone.should eq "4444444444"
    end

    it "does not throw errors if a field is blank" do
      applicant = FactoryGirl.build(:applicant,
                                    school_phone: nil)

      expect{applicant.strip_extra_characters}.to_not raise_error
    end
  end
end

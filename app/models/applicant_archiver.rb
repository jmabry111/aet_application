class ApplicantArchiver
  def initialize(applicants)
    @applicants = applicants
  end
  
  def archive
    @applicants.each do |applicant|
      applicant.is_archived = true
      applicant.save
    end
  end
end
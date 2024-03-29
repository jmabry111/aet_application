class NotificationsMailer < ActionMailer::Base
  default :from => "aet-application@ialr.org"

  def invitations_message(applicant)
    @applicant = applicant
    mail(:to => @applicant.science_teacher_email, :subject => "Faculty Recommendation")
    mail(:to => @applicant.math_teacher_email, :subject => "Faculty Recommendation")
    mail(:to => @applicant.english_teacher_email, :subject => "Faculty Recommendation")
  end

end

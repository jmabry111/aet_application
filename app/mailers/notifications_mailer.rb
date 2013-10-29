class NotificationsMailer < ActionMailer::Base
  default :from => "application@pgsmst.com"

  def new_message(applicant, email)
    @applicant = applicant
    @email = email
    mail(:to => @email, :subject => "Piedmont AET Submitted Application")
  end
  
  def invitations_message(teacher_recommendation)
    @teacher_recommendation = teacher_recommendation
    mail(:to => @teacher_recommendation.email, :subject => "Piedmont AET Faculty Recommendation")
  end
  
  def reminder_message(teacher_recommendation)    
    @teacher_recommendation = teacher_recommendation
    mail(:to => @teacher_recommendation.email, :subject => "Piedmont AET Recommendation Reminder")
  end
  
  def confirmation_message(applicant)
    @applicant = applicant
    if @applicant.applicant_email.present?
      mail(:to => @applicant.applicant_email, :subject => "Piedmont AET Application Confirmation")
    end
  end
  
  def parent_confirmation_message(applicant)
    @applicant = applicant
    if @applicant.email.present?
      mail(:to => @applicant.email, :subject => "Piedmont AET Application Confirmation")
    end
  end
  
end

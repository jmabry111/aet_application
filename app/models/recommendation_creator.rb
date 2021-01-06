class RecommendationCreator

  def initialize(applicant)
    @applicant = applicant
  end

  def create_recommendations
    create_science_recommendation
    create_math_recommendation
    create_english_recommendation
  end
  
  private
  
  def create_science_recommendation
    create_recommendation('Science', @applicant.science_teacher_email, @applicant.science_teacher)
  end
  
  def create_math_recommendation
    create_recommendation('Math', @applicant.math_teacher_email, @applicant.math_teacher)
  end
  
  def create_english_recommendation
    create_recommendation('English', @applicant.english_teacher_email, @applicant.english_teacher)
  end
  
  def mail_recommendation(teacher_recommendation)
    NotificationsMailer.invitations_message(teacher_recommendation).deliver
  end
  
  def create_recommendation(subject, email, name)
      teacher_recommendation = @applicant.teacher_recommendations.new(subject: subject, email: email, teacher_name: name, last_notified_at: Time.now)
      teacher_recommendation.save(validate: false) #I'm assuming you have validations that you want to require for the teacher but enforce them now
      mail_recommendation(teacher_recommendation)
  end
  
end

class Applicant < ActiveRecord::Base
  attr_accessible :address, :email, :english_teacher, :first_name, :gender, :grade, :home_phone, :last_name, 
    :math_teacher, :middle_name, :parent_first_name, :parent_last_name, :school_id, :science_teacher, :work_phone,
    :school_phone, :counselor_name, :due_to, :date_due, :english_teacher_email, :science_teacher_email, :math_teacher_email, :applicant_confirmation, :parent_confirmation, :applicant_email, :city, :state, :zip, :gpa, :teacher_contacted, :is_archived, :school, :parent_texts_ok, :ethnicity, :after_graduation_plans, :degree_plans, :additional_academic_info, :engineering_essay, :interests_essay, :track, :psat_math, :psat_english, :vpt_math, :vpt_english, :essay1_score, :essay2_score
    
  belongs_to :school
  has_many :teacher_recommendations
  
  before_save :strip_extra_characters
  
  validates :school, presence:true
  validates :first_name, presence:true, length: {maximum: 25}
  validates :last_name, presence:true, length: {maximum: 25}
  validates :parent_first_name, presence:true, length: {maximum: 25}
  validates :parent_last_name, presence:true, length: {maximum: 25}
  validates :address, presence:true
  VALID_PHONE_REGEX = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  validates :home_phone, presence:true, format: {with:VALID_PHONE_REGEX}
  validates :work_phone, presence: true, format: {with:VALID_PHONE_REGEX}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, allow_blank:true,  format: {with:VALID_EMAIL_REGEX}
  validates :math_teacher, presence:true, length: {maximum: 50}
  validates :math_teacher_email, presence:true,  format: {with:VALID_EMAIL_REGEX}
  validates :science_teacher, presence:true, length: {maximum: 50}
  validates :science_teacher_email, presence:true,  format: {with:VALID_EMAIL_REGEX}
  validates :english_teacher, presence:true, length: {maximum: 50}
  validates :english_teacher_email, presence:true,  format: {with:VALID_EMAIL_REGEX}
  validates :applicant_confirmation, presence:true, on: :create
  validates :parent_confirmation, presence:true, on: :create
  validates :school_phone, allow_blank:true, format: {with:VALID_PHONE_REGEX}, on: :update
  validates :date_due, presence:true, on: :update
  validates :city, presence:true
  validates :state, presence:true
  VALID_ZIP_REGEX = /\d{5}/
  validates :zip, presence:true, format: {with:VALID_ZIP_REGEX}
  validates :applicant_email, allow_blank:true, format: {with:VALID_EMAIL_REGEX}
  VALID_GPA_REGEX = /^[0]|[0-3]\.(\d?\d?)|[4].[0]$/
  validates :gpa, presence:true, format: {with:VALID_GPA_REGEX}, on: :update
  validates :teacher_contacted, presence:true, on: :create
  validates :track, presence: true, on: :create
# validates :engineering_essay, presence: true, on: :create
# validates :interests_essay, presence: true, on: :create
  
  

  def strip_extra_characters
    self.home_phone = remove_non_digit_characters(home_phone)
    self.work_phone = remove_non_digit_characters(work_phone)
    self.school_phone = remove_non_digit_characters(school_phone)
  end
  
  def to_s
    "#{first_name} #{last_name}"
  end
    
  def science_recommendation
    science_recommendation = find_recommendation_by_subject("Science")
  end
  def science_recommendation_not_complete?
    science_recommendation = find_recommendation_by_subject("Science")
    science_recommendation.recommendation == nil
  end
  
  def math_recommendation
    math_recommendation = find_recommendation_by_subject("Math")
  end
  def math_recommendation_not_complete?
    math_recommendation = find_recommendation_by_subject("Math")
    math_recommendation.recommendation == nil
  end
    
  def english_recommendation
    english_recommendation = find_recommendation_by_subject("English")
  end
  def english_recommendation_not_complete?
    english_recommendation = find_recommendation_by_subject("English")
    english_recommendation.recommendation == nil
  end
  
  def count_recommendations
    teacher_recommendations.select(&:complete?).count
  end
  def count_non_complete_recommendations
    teacher_recommendations.count
  end
  
  def counselor_portion_complete?
    gpa.present? && date_due.present?
  end
  
  def applicant_portion_complete?
    first_name.present? && last_name.present? && home_phone.present? && parent_confirmation.present?
  end
 
  def self.search(search)
    if search
      #self.basic_search(search)
      where('first_name iLIKE ? OR last_name iLIKE ? OR name iLIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
  
  def self.active
    where(is_archived: !true)
  end
  
  private 
  
  def find_recommendation_by_subject(subject)
    teacher_recommendation = teacher_recommendations.find_by_subject(subject)
  end
  def remove_non_digit_characters(string)
    if string.present?
      string.gsub(/[^0-9]/, "")
    end
  end
end

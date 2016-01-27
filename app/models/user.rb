class User < ActiveRecord::Base
  
  has_many :user_designations
  has_many :schools, :through => :user_designations
  has_many :applicants, :through => :schools
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  after_create { |user| user.send_reset_password_instructions }
  def password_required?
    new_record? ? false : super
  end
  
  def is_admin?
    self.admin
  end
  
end

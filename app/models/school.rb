class School < ActiveRecord::Base
  
  has_many :applicants
  has_many :user_designations
  has_many :users, :through => :user_designations

  validates :name, presence: true, length: {maximum: 50}
  
  def self.list
    School.pluck(:name)
  end
end

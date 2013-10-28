class School < ActiveRecord::Base
  
  attr_accessible :name, :user_id
  has_many :applicants
  has_many :user_designations
  has_many :users, :through => :user_designations

  validates :name, presence: true, length: {maximum: 50}
  
  def self.list
    School.all(:select => :name).collect(&:name)
  end
  

end
class UserDesignation < ActiveRecord::Base
#   attr_accessible :school_id, :user_id, :description
   
   belongs_to :school
   belongs_to :user
end

class StaticPagesController < ApplicationController
  
  skip_before_filter :authenticate_user!
  before_filter :reject_if_registration_closed, :except => [:closed]
  
  
  protected
    def reject_if_registration_closed
      logger.info ENV['REGISTRATION_OPEN']
      unless ENV['REGISTRATION_OPEN'] == 'true'
        redirect_to closed_path
      end
    end
end

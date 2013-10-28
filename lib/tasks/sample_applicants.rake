namespace :db do
  desc "Add Sample Data"
  task populate: [:environment, 'db:migrate'] do 
    require 'factory_girl_rails'      

    99.times do
      applicant = FactoryGirl.create(:full_applicant_with_teacher_recommendations)
    end  
  end
end
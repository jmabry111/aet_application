namespace :db do
  desc "Add Sample Data"
  task populatetr: :environment do 
    require 'factory_girl_rails'             
    297.times do
      FactoryGirl.create(:teacher_recommendation)
    end    
  end
end
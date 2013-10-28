class Coordinator::RecommendationRemindersController < ApplicationController

  def create
    @teacher_recommendation = TeacherRecommendation.find_by_slug!(params[:teacher_recommendation_id])
    @teacher_recommendation.update_attribute(:last_notified_at, Time.now)
    NotificationsMailer.reminder_message(@teacher_recommendation).deliver
    flash[:success] = "Reminder successfully sent"
    redirect_to coordinator_applicant_path(@teacher_recommendation.applicant.id)
  end
  
  def update
    @teacher_recommendation = TeacherRecommendation.find_by_slug!(params[:teacher_recommendation_id])
    @teacher_recommendation.update_attribute(:teacher_name, (params[:teacher_recommendation][:teacher_name]))
    @teacher_recommendation.update_attribute(:email, (params[:teacher_recommendation][:email]))
    @teacher_recommendation.update_attribute(:last_notified_at, Time.now)
    NotificationsMailer.reminder_message(@teacher_recommendation).deliver
    flash[:success] = "Information updated and reminder successfully sent"
    redirect_to coordinator_applicant_path(@teacher_recommendation.applicant.id)
  end
end

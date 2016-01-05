class TeacherRecommendationsController < ApplicationController
  
  skip_before_filter :authenticate_user!, :only => [:new, :show, :create, :edit, :update, @thanks_path]
   
  def new
    @teacher_recommendation = TeacherRecommendation.new
  end

  def teacher_recommendation_params
    params.require(:teacher_recommendation).permit(:aptitude, :date_submitted, :dedication, :desire, :inquiry_skills, :interaction, :persistence, :problem_solving, :recommendation, :self_discipline, :study_skills, :subject, :teamwork, :time_management, :work_ethic, :applicant_id, :email, :teacher_name, :last_notified_at)
  end

  def create
    @teacher_recommendation = TeacherRecommendation.new(teacher_recommendation_params)
    if @teacher_recommendation.save
      redirect_to thanks_path
    else
      render 'new'
    end
  end
  
  def edit
    @teacher_recommendation = TeacherRecommendation.find_by_slug!(params[:id])
    if @teacher_recommendation.editable?
      @teacher_recommendation = TeacherRecommendation.find_by_slug!(params[:id])
    else
      redirect_to sorry_path
    end
  end
  
  def update
    @teacher_recommendation = TeacherRecommendation.find_by_slug!(params[:id])
    if @teacher_recommendation.update_attributes(teacher_recommendation_params)
      flash[:success] = "Recommendation Submitted"
      redirect_to thanks_path
    else
      render 'edit'
    end
  end
  
  
end

class Coordinator::TeacherRecommendationsController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:new, :show, :create, :edit, @thanks_path]

  def new
    @applicant = Applicant.find(params[:applicant_id])
  end

  def create
    @teacher_recommendation = TeacherRecommendation.new(params[:teacher_recommendation])
    if @teacher_recommendation.save
      redirect_to thanks_path
    else
      render 'new'
    end
  end

  def edit
    @teacher_recommendation = TeacherRecommendation.find_by_slug!(params[:id])
  end
  
  def show
    @teacher_recommendation = TeacherRecommendation.find_by_slug!(params[:id])
  end
end

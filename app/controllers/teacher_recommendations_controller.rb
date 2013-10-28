class TeacherRecommendationsController < ApplicationController
  
  skip_before_filter :authenticate_user!, :only => [:new, :show, :create, :edit, :update, @thanks_path]
   
  def new
    @teacher_recommendation = TeacherRecommendation.new
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
    if @teacher_recommendation.editable?
      @teacher_recommendation = TeacherRecommendation.find_by_slug!(params[:id])
    else
      redirect_to sorry_path
    end
  end
  
  def update
    @teacher_recommendation = TeacherRecommendation.find_by_slug!(params[:id])
    if @teacher_recommendation.update_attributes(params[:teacher_recommendation])
      flash[:success] = "Recommendation Submitted"
      redirect_to thanks_path
    else
      render 'edit'
    end
  end
  
  
end

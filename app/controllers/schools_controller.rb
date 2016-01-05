class SchoolsController < ApplicationController
  
  before_filter :authenticate_user!

  def school_params
    params.require(:school).permit(:name, :user_id)
  end
  
  def index
    @schools = School.paginate(page: params[:page])
  end
  
  def new
    @school = School.new
  end
  
  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to @school
    else
      render 'new'
    end
  end
  
  def show
    @school = School.find(params[:id])
  end
  
  def edit
    @school = School.find(params[:id])
  end
  
  def update
    @school = School.find(params[:id])
    if @school.update_attributes(params[:school])
      flash[:success] = "School successfully updated"
      redirect_to @school
    else
      render 'edit'
    end
  end
end

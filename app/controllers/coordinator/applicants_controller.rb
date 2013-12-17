class Coordinator::ApplicantsController < ApplicationController
  helper_method :sort_column, :sort_direction

  skip_before_filter :authenticate_user!, :only => [:new, :show, :create]

  def index
    if current_user.is_admin?
      @applicants = Applicant.joins(:school).search(params[:search]).order(sort_column + " " + sort_direction).per_page_kaminari(params[:page]).per(50).active
    else
      #@applicants = Applicant.paginate(page: params[:page])
      @applicants = current_user.applicants.search(params[:search]).order(sort_column + " " + sort_direction).per_page_kaminari(params[:page]).per(50)
      #applicant = current_user.applicants.all(:order => 'first_name', :joins => :school)
      #@applicants = Applicant.where(:school_id => current_user.schools.pluck(:id)).paginate(page: params[:page])
    end
  end

  def show
    @applicant = find_applicant_or_redirect
  end 

  def edit
    @applicant = find_applicant_or_redirect
    @ethnicity = [Ethnicity.list].flatten
  end

  def update
    @applicant = find_applicant_or_redirect
    if @applicant.update_attributes(params[:applicant])
      flash[:success] = "Section 2 Completed"
      redirect_to invite_teachers_coordinator_applicant_path(@applicant)
    else
      render 'edit'
    end
  end

  def invite_teachers
    @applicant = find_applicant_or_redirect
  end

  def create_invitations
    @applicant = find_applicant_or_redirect
    @applicant.update_attributes(params[:applicant])
    if has_all_teachers?
      if emails_in_correct_format?
        #call your recommendation generator here
        if @applicant.teacher_recommendations.count == 0
          RecommendationCreator.new(@applicant).create_recommendations
          flash[:success] = "Invitations successfully sent"
          redirect_to coordinator_applicants_path
        else
          flash[:success] = "Recommendations already exist. To remind teachers, please click the desired applicant's name."
          redirect_to coordinator_applicants_path
        end
      else
        flash[:notice] = "Please enter a valid email address for each teacher."
        redirect_to invite_teachers_coordinator_applicant_path(@applicant)
      end
    else
      flash[:notice] = "You must provide an email address for all teachers!"
      redirect_to invite_teachers_coordinator_applicant_path(@applicant)
    end
  end

  def destroy
  end
  
  def archive
    archive_current_students
  end

  private

  def has_all_teachers?
    @applicant.science_teacher_email.present? && @applicant.math_teacher_email.present? && @applicant.english_teacher_email.present?
  end
  
  def emails_in_correct_format?
    @applicant.science_teacher_email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) &&
    @applicant.math_teacher_email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) &&
    @applicant.english_teacher_email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end
  
  private
  def find_applicant_or_redirect
    applicant = Applicant.find_by_id(params[:id])
    unless applicant
     flash[:notice] = "This applicant does not exist"
     redirect_to coordinator_applicants_path
    end
    applicant
  end
  
  def archive_current_students
    if @applicant.is_archived = false
      @applicant.toggle!(:is_archived)
    end
    flash[:notice] = "All applicants have been archived"
  end
  
  def sort_column
    Applicant.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
    Applicant.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction ]) ? params[:direction] : "asc"
  end

end

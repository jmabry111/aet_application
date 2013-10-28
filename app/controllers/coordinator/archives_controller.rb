class Coordinator::ArchivesController < ApplicationController
  
  def index
    if current_user.is_admin?
      @applicants = Applicant.joins(:school).search(params[:search]).order(sort_column + " " + sort_direction).where(:is_archived => true)
      #@applicants = Applicant.per_page_kaminari(params[:page]).per(50).where(:is_archived => true)
      @applicant_years = @applicants.group_by {|y| y.created_at.beginning_of_year}
    else
      @applicants = current_user.applicants.per_page_kaminari(params[:page]).per(50).where(:is_archived => true)
      #@applicants = current_user.applicants.search(params[:search]).order(sort_column + " " + sort_direction).per_page_kaminari(params[:page]).per(50)
      @applicant_years = @applicants.group_by {|y| y.created_at.beginning_of_year}
    end
  end
  
  def create
    applicants = Applicant.where(:is_archived => false)
    ApplicantArchiver.new(applicants).archive
    flash[:notice] = "All applicants now archived"
    redirect_to coordinator_archives_path
  end
 
 
  private
  
  def sort_column
    Applicant.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
    Applicant.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction ]) ? params[:direction] : "asc"
  end
  
  
end

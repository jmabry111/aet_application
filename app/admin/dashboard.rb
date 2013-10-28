ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
#    div :class => "blank_slate_container", :id => "dashboard_default_message" do
#      span :class => "blank_slate" do
#        span "Welcome to Active Admin. This is the default dashboard page."
#        small "To add dashboard sections, checkout 'app/admin/dashboards.rb'"
#      end
#    end
  
 columns do
    
    column do
      panel "Recent Applicants" do
        table_for Applicant.order('created_at DESC').limit(10) do
          column("Name")    {|applicant| link_to applicant, admin_applicant_path(applicant.id)}
          column("School")  {|applicant| applicant.school.name}
          column("Science Teacher")  {|applicant| applicant.science_teacher}
          column("Math Teacher")  {|applicant| applicant.math_teacher}
          column("English Teacher")  {|applicant| applicant.english_teacher}
          column("# of Completed Recommendations") {|a| a.teacher_recommendations.select(&:complete?).count}
        end
      end
    end
  end
  

  columns do
    column do
        table_for School.order('name') do
          column("School Name") {|school| school.name}
        end
      end
#    end
    column do
      panel "Current Users" do
        table_for User.order('id') do
          column("Name") {|user| user.name}
          column("User Id")         {|user| user.email}
#          column("Affiliated School")          {|user| user.school.name}
          column("Administrator?")  {|user| user.admin}
        end
      end
    end
  end
  
  end # content
end

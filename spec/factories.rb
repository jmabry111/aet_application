FactoryGirl.define do
  sequence (:phone) do |n|
    "222-111-#{n}"
  end  
  sequence (:applicant) do |n|
    "#{n}"
  end
end

FactoryGirl.define do
  factory :applicant do
    first_name "Peter"
    last_name "Parker"
    grade 12
    parent_first_name "Aunt"
    parent_last_name "Mae"
    home_phone "222-333-3333"
    work_phone "222-111-1111"
    email "spiderman@example.com"
    math_teacher "Teacher 1"
    science_teacher "Teacher 2"
    english_teacher "Teacher 3"
  end
end

FactoryGirl.define do
  factory :science_recommendation, class: TeacherRecommendation do
     aptitude {4}
     date_submitted {Time.now}
     dedication {4}
     desire {4}
     inquiry_skills {4}
     interaction {4}
     persistence {4}
     problem_solving {4}
     recommendation {4}
     self_discipline {4}
     study_skills {4}
     subject {"Science"}
     teamwork {4}
     time_management {4}
     work_ethic {4}
     teacher_name {applicant.science_teacher}
     email {applicant.science_teacher_email}
     last_notified_at {Time.now} 
  end
  
  factory :math_recommendation, class: TeacherRecommendation do
     aptitude {3}
     date_submitted {Time.now}
     dedication {3}
     desire {3}
     inquiry_skills {3}
     interaction {3}
     persistence {3}
     problem_solving {3}
     recommendation {3}
     self_discipline {3}
     study_skills {3}
     subject {"Math"}
     teamwork {3}
     time_management {3}
     work_ethic {3}
     teacher_name {applicant.math_teacher}
     email {applicant.math_teacher_email}
     last_notified_at {Time.now} 
  end
  
  factory :english_recommendation, class: TeacherRecommendation do
     aptitude {3}
     date_submitted {Time.now}
     dedication {3}
     desire {3}
     inquiry_skills {3}
     interaction {3}
     persistence {3}
     problem_solving {3}
     recommendation {3}
     self_discipline {3}
     study_skills {3}
     subject {"English"}
     teamwork {3}
     time_management {3}
     work_ethic {3}
     teacher_name {applicant.english_teacher}
     email {applicant.english_teacher_email}
     last_notified_at {Time.now} 
  end
  
  factory :full_applicant, parent: :applicant do
    school {School.all.sample}
    first_name {Faker::Name.first_name}
    middle_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    grade {11}
    email {Faker::Internet.email}
    gender  {"Male"}
    parent_first_name {Faker::Name.first_name}
    parent_last_name {Faker::Name.last_name}
    address {Faker::Address.street_name}
    city {Faker::Address.city}
    state {Faker::Address.state}
    zip {Faker::Address.zip_code}
    home_phone {"5555551212"}
    work_phone {"5555551212"}
    track {"Engineering"}
    math_teacher {Faker::Name.name}
    math_teacher_email {Faker::Internet.email}
    science_teacher {Faker::Name.name}
    science_teacher_email {Faker::Internet.email}
    english_teacher {Faker::Name.name}
    english_teacher_email {Faker::Internet.email}
    applicant_confirmation {true}
    parent_confirmation {true}
    teacher_contacted {true}
    applicant_email {Faker::Internet.email}
    is_archived false
    school_phone {"5555551212"}
    gpa {3.8}
    date_due {Time.now + 2.weeks}
    
    factory :full_applicant_with_teacher_recommendations do
      ignore do
        science_recommendations_count 1
        math_recommendations_count 1
        english_recommendations_count 1
      end
      
      after(:create) do |applicant|
        FactoryGirl.create_list(:science_recommendation, 1, applicant: applicant)
        FactoryGirl.create_list(:math_recommendation, 1, applicant: applicant)
        FactoryGirl.create_list(:english_recommendation, 1, applicant: applicant)
      end
    end
  end
end
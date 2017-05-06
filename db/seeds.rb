# This is the seeds for Faker gem. We are using this to test 

Teacher.create!(user_name: "test",
                teacher_icon_name: "test1",
                teacher_name: "Test Teacher",
                teacher_email: "test@test.com",
                admin_powers: "true",
                analysis_powers: "true",
                teacher_description: "Teacher used for testing",
                color: "red",
                school_id: "1",
                teacher_password: "testing",
                teacher_password_confirmation: "test")

10.times do |n|
  name  = Faker::Name.name
  username = "example-#{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  Teacher.create!(user_name: username,
                teacher_icon_name: "test1",
                teacher_name: name,
                teacher_email: email,
                admin_powers: "false",
                analysis_powers: "false",
                teacher_description: "Teacher used for testing",
                color: "red",
                school_id: 1,
                teacher_password: password,
                teacher_password_confirmation: password)
end

10.times do |n|
  name  = Faker::Name.name
  Student.create!(student_icon_name: name,
                  student_contact_info: "student contact info",
                  student_description: "student description",
                  student_icon: "temp",
                  color: "red",
                  school_id: 1,
                  student_name: name)
end
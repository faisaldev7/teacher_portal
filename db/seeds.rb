# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

teacher1 = Teacher.find_or_create_by!(email: "teacher1@example.com") do |teacher|
  teacher.username =  'teacher1'
  teacher.password = 'password'
  teacher.password_confirmation = 'password'
end

teacher2 = Teacher.find_or_create_by!(email: "teacher1@example.com") do |teacher|
  teacher.username =  'teacher2'
  teacher.password = 'password'
  teacher.password_confirmation = 'password'
end

Student.find_or_create_by!(name: 'John Doe', subject: 'Math', teacher: teacher1) do |student|
  student.marks = 75
end

Student.find_or_create_by!(name: 'Randy Orton', subject: 'Science', teacher: teacher1) do |student|
  student.marks = 85
end

Student.find_or_create_by!(name: 'Mary Smith', subject: 'English', teacher: teacher2) do |student|
  student.marks = 90
end

Student.find_or_create_by!(name: 'Tom Jones', subject: 'History', teacher: teacher2) do |student|
  student.marks = 65
end

Student.find_or_create_by!(name: 'Faisal Anwar', subject: 'English', teacher: teacher2) do |student|
  student.marks = 90
end

Student.find_or_create_by!(name: 'John Snow', subject: 'English', teacher: teacher2) do |student|
  student.marks = 90
end

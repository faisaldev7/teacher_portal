require 'rails_helper'

RSpec.describe "Students", type: :request do
  include Devise::Test::IntegrationHelpers

  let(:teacher) { Teacher.create!(email: "teacher@example.com", password: "password", username: "teacher_username") }

  before do
    sign_in teacher
  end

  describe "GET /index" do
    it "shows the student list" do
      get students_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new student if not exists" do
      post students_path, params: { name: "John", subject: "Math", marks: 50, teacher: teacher }
      expect(Student.count).to eq(1)
    end

    it "updates marks if student exists" do
      Student.create!(name: "John", subject: "Math", marks: 50, teacher: teacher)
      post students_path, params: { name: "John", subject: "Math", marks: 20 }
      expect(Student.first.marks).to eq(70)
    end
  end

  describe "DELETE /destroy" do
    it "deletes the student" do
      student = Student.create!(name: "John", subject: "Math", marks: 50, teacher: teacher)
      delete student_path(student)
      expect(response).to have_http_status(:redirect)
      expect(Student.count).to eq(0)
    end
  end
end

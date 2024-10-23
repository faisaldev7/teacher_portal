require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:teacher) { Teacher.create!(email: "teacher@example.com", password: "password", username: "teacher_username") }

  it "is valid with valid attributes" do
    student = Student.new(name: "John Doe", subject: "Math", marks: 90, teacher: teacher)
    expect(student).to be_valid
  end

  it "is not valid without a name" do
    student = Student.new(name: nil, teacher: teacher)
    expect(student).to_not be_valid
  end
end

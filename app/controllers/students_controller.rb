class StudentsController < ApplicationController
  before_action :authenticate_teacher!

  def index
    @students = current_teacher.students
  end

  def new
    @student = Student.new
  end

  def create
    existing_student = current_teacher.students.find_by(name: student_params[:name], subject: student_params[:subject])

    if existing_student
      existing_student.update(marks: existing_student.marks + student_params[:marks].to_i)
      flash[:success] = 'Marks updated for existing student.'
      redirect_to students_path
    else
      @student = current_teacher.students.build(student_params)

      if @student.save
        flash[:success] = "Student successfully created."
        redirect_to students_path
      else
        flash.now[:error] = "There was an error adding the student."
        render :new
      end
    end
  end

  def edit
    @student = current_teacher.students.find(params[:id])
  end

  def update
    @student = current_teacher.students.find(params[:id])

    if @student.update(student_params)
      render json: { message: "Student details successfully updated" }, status: :ok
    else
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @student = current_teacher.students.find(params[:id])
    @student.destroy
    flash[:success] = "Student successfully deleted"
    redirect_to students_path
  end

  private

  def student_params
    params.permit(:name, :subject, :marks)
  end
end

class StudentsController < ApplicationController
  include ApplicationHelper

 def index
  @q = Student.ransack(permitted_student_params(params))
  @q.sorts = "updated_at desc" if @q.sorts.empty?
  @students = @q.result.includes(:groups, :student_groups)

  respond_to do |format|
    format.html
  end
 end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "成功"
      redirect_to root_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :sex, :paid_lessons, group_ids: [])
  end
end

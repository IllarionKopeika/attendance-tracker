class CoursesController < ApplicationController
  def index
    @courses = Course.includes(:lessons)
  end

  def show
    @course = Course.find(params[:id])
    @lessons = @course.lessons.order(given_at: :asc)
  end
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      Lesson.transaction do
        @course.lessons_count.to_i.times { @course.lessons.create! }
      end
      flash[:success] = "成功"
      redirect_to @course
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :group_id, :lessons_count)
  end
end

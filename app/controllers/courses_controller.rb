class CoursesController < ApplicationController
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
      redirect_to root_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :group_id, :lessons_count)
  end
end

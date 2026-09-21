class LessonsController < ApplicationController
  before_action :set_lesson, only: [ :edit, :update ]
  def edit; end

  def update
    if @lesson.update(lesson_params)
      flash[:success] = "成功"
      redirect_to @lesson.course
    else
      render "edit", status: :unprocessable_entity
    end
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:teaching_method, :given_at)
  end
end

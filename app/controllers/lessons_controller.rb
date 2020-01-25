class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:show]

  def create
    @course = current_lesson.section.course(course_params)
  end

  def show
    @course = Lesson.find(params[:id])
  end

  private

  def require_authorized_for_current_lesson
    if current_lesson.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end

class UserLessonsController < ApplicationController
  before_action :find_lesson, only: %i(new create)
  before_action :load_words, only: %i(new create)

  def new
    @user_lesson = UserLesson.new
    @words = @lesson.words
    @result = @user_lesson.results.build
  end

  def create
    @user_lesson = UserLesson.new user_lesson_params
    if @user_lesson.save
      flash[:success] = t "user_lesson.create_success"
    else
      flash[:warning] = t "user_lesson.create_failure"
    end
    redirect_to lessons_path
  end

  private

  def user_lesson_params
    params.require(:user_lesson).permit :lesson_id, :user_id,
      results_attributes: [:word_id, :answer_id]
  end

  def find_lesson
    @lesson = Lesson.find_by id: params[:lesson_id]
  end

  def load_words
    @words = @lesson.words
  end
end

class LessonsController < ApplicationController
  before_action :find_lesson, only: :show
  before_action :load_words, only: :show

  def index
    @lessons = Lesson.all.page(params[:page]).per Settings.rows
  end

  def show

  end

  private

  def find_lesson
    @lesson = Lesson.find_by id: params[:id]
  end

  def load_words
    @words = @lesson.words
  end

  def lesson_params
    params.require(:lesson).permit user_lessons_attributes: [:progress],
                                   results_attributes: [:user_lessons_id, :word_id, :answer_id]
  end

end

class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all.page(params[:page]).per Settings.rows
  end
end

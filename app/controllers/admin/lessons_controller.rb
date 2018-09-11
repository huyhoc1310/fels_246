class Admin::LessonsController < Admin::BaseController
  before_action :authenticate_user!

  def index
    @lessons = Lesson.load_lessons
  end

  def new
    @lesson = Lesson.new
    @categories = Category.load_categories
    @lesson_words = @lesson.lesson_words.build
    @words = []
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      flash[:success] = t "admin.lessons.success"
      redirect_to admin_lessons_path
    else
      flash[:danger] = t "admin.lessons.failure"
      render :new
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit :name, :time,
      lesson_words_attributes: [:lesson_id, :category_id, :word_id]
  end
end

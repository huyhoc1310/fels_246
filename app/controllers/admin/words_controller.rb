class Admin::WordsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :load_categories
  before_action :load_languages

  def index
    @words = Word.load_words.page(params[:page]).per Settings.rows
  end

  def new
    @word = Word.new
    @images = @word.images.build
    Settings.answers.times do
      @answers = @word.answers.build
    end
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = t "admin.words.save_success"
      redirect_to admin_words_path
    else
      flash[:warning] = t "admin.words.save_fail"
    end
  end

  private

  def word_params
    params.require(:word).permit :name, :language_id, :category_id, :meaning,
      answers_attributes: [:answer_id, :content, :is_correct],
      images_attributes: [:imageable_type, :imageable_id, :image]
  end

  def load_categories
    @categories = Category.all
  end

  def load_languages
    @languages = Language.all
  end
end

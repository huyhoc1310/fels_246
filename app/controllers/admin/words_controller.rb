class Admin::WordsController < ApplicationController
  before_action :load_categories
  before_action :load_languages

  def index
    @words = Word.all
  end

  def new
    @word = Word.new
    # @image = @word.image.build
    4.times do
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
      image_attributes: [:id, :imageable_type, :imageable_id, :image],
      answers_attributes: [:id, :answer_id, :content, :is_correct]
  end

  def load_categories
    @categories = Category.all
  end

  def load_languages
    @languages = Language.all
  end
end

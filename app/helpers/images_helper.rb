module ImagesHelper
  def find_img_word word_id
    @images = Image.find_words_image word_id
  end
end

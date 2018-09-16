class Admin::CategoriesController < Admin::BaseController
  before_action :authenticate_user!
  before_action :load_categories, only: :index
  before_action :load_category, except: %i(index new create)

  def index
    @categories = Category.load_category_minimal
  end

  def show
    @words = @category.words
    respond_to do |format|
      format.js{render json: @words}
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "flashs.create_category_success"
      redirect_to admin_categories_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "flashs.category_updated"
      redirect_to admin_categories_url
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "flashs.category_deleted"
    else
      flash[:danger] = t "flashs.fail_delete_category"
    end
    redirect_to admin_categories_url
  end

  private

  def category_params
    params.require(:category).permit :name, :description
  end

  def load_categories
    @categories = Category.all
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "flashs.not_found_category"
    redirect_to admin_categories_path
  end
end

class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin!
  before_action :load_category, except: %i(new create)

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "flashs.create_category_success"
      redirect_to categories_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "flashs.category_updated"
      redirect_to categories_url
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
    redirect_to request.referrer || categories_url
  end

  private

  def category_params
    params.require(:category).permit :name, :description
  end

  def verify_admin!
    redirect_to root_url unless current_user.admin?
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "flashs.not_found_category"
    redirect_to admin_categories_path
  end
end

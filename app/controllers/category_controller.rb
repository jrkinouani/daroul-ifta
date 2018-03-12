class CategoryController < ApplicationController
  before_action :set_category, only: [:update]

  def update
    @category.update(category_params)
    redirect_to :back
  end

  private

  def set_category
    @category = Category.find(params[:id])
    redirect_to question_url(@category) and return
  end

  def category_params
    params.require(:category).permit(
      subcategories_attributes: [
        :category_id,
        :_destroy,
        keywords_attributes: [
          :subcategory_id,
          :_destroy,
        ]
      ]
    )
  end
end
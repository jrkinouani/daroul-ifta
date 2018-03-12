class KeywordsController < ApplicationController
  def index
    @keywords = Keyword.where(subcategory_id: params[:id])
    render partial: "keywords/option_for_select"
  end
end
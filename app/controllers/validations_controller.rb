class ValidationsController < ApplicationController

  def create
    @validation = Validation.find_or_create(params[:admin_id], params[:answer_id])
    redirect_back(fallback_location: root_path)
  end

end
class ModerationsController < ApplicationController
  respond_to :json
  load_and_authorize_resource
  def index
    respond_to do |format|
      format.json { render json: Moderation.all}
      format.html
    end
  end

  def create
    respond_with Visitor.create(moderation_params)
  end

  def destroy
    respond_with Moderation.destroy(params[:id])
  end

  private 

  def moderation_params
    params.require(:moderation).permit(:first_name, :last_name, :reason, :category_id,)
  end
end

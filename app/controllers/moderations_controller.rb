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
    if moderation_params.keys.include?("user_id")
      respond_with Visitor.create(moderation_params)
    else 
      respond_with Visitor.create(moderation_params.merge(user_id: current_user.id))
    end
  end

  def update
    respond_with Moderation.find(params[:id]).update_attributes(moderation_params)
  end

  def show
    respond_with Moderation.find(params[:id])
  end

  def destroy
    respond_with Moderation.destroy(params[:id])
  end

  private 

  def moderation_params
    params.require(:moderation).permit(:first_name, :last_name, :reason, :category_id, :user, :user_id)
  end
end

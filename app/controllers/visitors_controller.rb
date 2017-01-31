class VisitorsController < ApplicationController
  respond_to :json
  load_and_authorize_resource
  def index
    respond_to do |format|
      format.json { render json: Visitor.all }
      format.html
    end
  end

  def create
    # respond_with Moderation.create(visitor_params)
    respond_with Moderation.create(visitor_params.merge(user_id: current_user.id))
  end

  def destroy
    respond_with Visitor.destroy(params[:id])
  end

  def update
    respond_with Visitor.find(params[:id]).update_attributes(visitor_params)
  end

  def show
    respond_with Visitor.find(params[:id])
  end

 

  private
  
  def visitor_params
    params.require(:visitor).permit(:first_name, :last_name, :reason, :category_id)
  end
end

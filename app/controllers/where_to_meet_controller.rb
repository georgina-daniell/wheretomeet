class WhereToMeetController < ApplicationController
  def create
    # render plain: params[:where_to_meet].inspect
    if locations_params
      render json: Main.new.call(locations_params), status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  def index

  end

  def new

  end

  def locations_params
    params[:where_to_meet].require(:locations).split(',')
  end
end
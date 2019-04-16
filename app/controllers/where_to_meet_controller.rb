class WhereToMeetController < ApplicationController
  def create
    render json: Main.new.call(params), status: :ok
  end

  def params
    params.require(:locations)
  end
end
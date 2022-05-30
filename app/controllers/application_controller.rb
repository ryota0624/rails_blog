class ApplicationController < ActionController::Base
  def json_response(data)
    respond_to do |format|
      format.any { render json: {
        :data => data
      } }
    end
  end
end

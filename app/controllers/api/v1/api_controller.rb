module Api::V1
  
  class ApiController < ApplicationController
    rescue_from(ActiveRecord::RecordNotFount) do ||
      render(json: {message: 'Not Found'}, status: :not_found)
    end
    rescue_from(ActiveRecord::ParameterMissing) do |parameter_missing_exception|
      render(json: {message: "Required parameter missing: #{parameter_missing_exception.param}"}, status: :bad_request)
    end
  end
  
end
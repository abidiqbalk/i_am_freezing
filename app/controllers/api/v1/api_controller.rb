class Api::V1::ApiController < ApplicationController
  include ResponseHandler
  include ExceptionHandler

  def auth_thermostat
    begin
      @thermostat = Thermostat.fetch_thermo(request.headers['Authorization'].split(' ').last)
      raise "Invalid Thermostat" if @thermostat.nil?
    rescue
      render json: {error: 'Invalid thermostat'}, status: :unauthorized
    end
  end
end

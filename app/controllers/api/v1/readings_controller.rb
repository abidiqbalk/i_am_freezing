class Api::V1::ReadingsController < Api::V1::ApiController
  before_action :auth_thermostat,except: :show
  skip_before_action :verify_authenticity_token

  def create
    @reading = @thermostat.readings.create(reading_params)
    json_response(@reading, :created)
  end
  def show
    reading = Reading.find(params[:id])
    json_response(reading,:ok)
  end
  def stats
    @readings = @thermostat.readings
  end
private
  def reading_params
    params.require(:reading).permit(:id,:thermostat_id,:number,:temperature,:humidity,:battery_charge)
  end
end

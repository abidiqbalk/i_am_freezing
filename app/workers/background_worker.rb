class BackgroundWorker
  include Sidekiq::Worker

  def perform(*args,thermo_id)
    thermostat= Thermostat.find(thermo_id)
    @reading = @thermostat.readings.create(reading_params)
  end
end

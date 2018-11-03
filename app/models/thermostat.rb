class Thermostat < ApplicationRecord
  has_many :readings
  after_create :set_token
  
  def set_token
    token=JsonWebToken.encode({thermostat_id: id})
    update_attribute(:household_token,token)
  end
  def self.fetch_thermo token
    decoded_token = JsonWebToken.decode(token)
    Thermostat.find(decoded_token.first["thermostat_id"])
  end

end

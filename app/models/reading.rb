class Reading < ApplicationRecord
  belongs_to :thermostat
  after_create :generate_sequence_number
  scope :previous, lambda {|id| where("id < ?",id) }
  def generate_sequence_number
    update_attribute(:number,(thermostat.readings.previous(id).last.number rescue 0 + 1))
  end
end

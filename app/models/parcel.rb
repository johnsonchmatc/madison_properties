class Parcel < ApplicationRecord
  require 'CSV'

  geocoded_by :generated_address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      parcel_hash = row.to_hash

      parcel = self.new
      parcel.address = parcel_hash["Address"]
      parcel.current_year_value = cleanup_dollar_values_from_csv(parcel_hash["Current Year Total Value"])
      parcel.previous_year_value = cleanup_dollar_values_from_csv(parcel_hash["Previous Year Total Value"])
      parcel.total_taxes = cleanup_dollar_values_from_csv(parcel_hash["Total Taxes"])

      save_time = Benchmark.measure { parcel.save }
      log = { event: 'parcel.import.save_time', message: save_time }
      puts log.to_json
    end
  end

  def generated_address
    self.address + ", Madison, WI"
  end

  def self.cleanup_dollar_values_from_csv(value)
    value.to_s.gsub('$','').to_f
  end
end

class AverageLocationService

  def call(locations)
    locations = hash_locations(locations)
    average(locations)
  end

  def hash_locations(locations)
    hashed_locations = []
    locations.each do |lat, lon|
      hashed_locations << { lat: lat, lon: lon }
    end
    hashed_locations
  end

  def average(hashed_locations)
    average_lat = hashed_locations.sum { |x| x[:lat] } / hashed_locations.size
    average_lon = hashed_locations.sum { |x| x[:lon] } / hashed_locations.size
    [average_lat, average_lon]
  end
end
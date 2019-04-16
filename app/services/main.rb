class Main
  def call(locations, type='google')
    locations = LatLongFromAddress.new.find_addresses(locations)
    al = AverageLocationService.new.call(locations)
    tube_stop_lat_longs = FindTubeStops.new.find_it(al, 3000, 5)
    case type
    when 'google'
      results = GoogleDirections.new.call(locations, tube_stop_lat_longs.map { |end_location| end_location[:location] })
    when 'city_mapper'
      results = []
      minutes = []
      tube_stop_lat_longs.each do |end_location|
        locations.each do |start_location|
          minutes << CityMapperDirections.new.call(start_location, end_location[:location])
        end
        results << { end_location[:name] => minutes.compact.reduce(0, :+) }
      end
    end
    results
  end
end






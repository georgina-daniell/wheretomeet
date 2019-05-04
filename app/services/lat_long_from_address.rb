class LatLongFromAddress

  def google_client
    @client ||= GooglePlaces::Client.new(ENV.fetch('GOOGLE_PLACES_KEY'))
  end

  def find_addresses(locations)
    lat_long_locations = []
    puts "locations = #{locations}"
    locations.each do |query|
      puts "query = #{query}"
      result = google_client.spots_by_query(query).first
      lat_long_locations << [result['lat'], result['lng']]
    end
    lat_long_locations
  end
end
class GoogleDirections

  def call(start_locations, end_locations)
    params = google_params(start_locations, end_locations)
    response = google_get(params)
    parse_response(response)
  end

  def parse_response(r)
    dests = r["destination_addresses"].size
    totals = []
    (0..(dests - 1)).each do |n|
      total_time = 0
      r["rows"].each do |row|
        total_time += row["elements"][n]["duration"]["value"]
      end
      totals << { r["destination_addresses"][n] => (total_time/60) }
    end
    totals
  end

  def google_get(params)
    HTTParty.get(google_url, params).parsed_response
  end

  def format_lat_long(lat_long)
    lat_long.map { |x| x.join(',') }.join('|')
  end

  def google_url
    'https://maps.googleapis.com/maps/api/distancematrix/json'
  end

  def google_params(start_locations, end_locations)
    { query: {
      key: ENV.fetch('GOOGLE_PLACES_KEY'),
      origins: format_lat_long(start_locations),
      destinations: format_lat_long(end_locations),
      mode: 'transit'
    } }
  end

end
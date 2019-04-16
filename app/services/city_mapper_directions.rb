class CityMapperDirections

  def call(startcoord, endcoord)
    params = citymapper_parameters(startcoord, endcoord)
    cm_get(params)

  end

  def cm_get(params)
    HTTParty.get(cm_url, params)["travel_time_minutes"]
  end


  def cm_url
    'https://developer.citymapper.com/api/1/traveltime/'
  end

  def citymapper_parameters(startcoord, endcoord)
    { query: {
      key: ENV['CITY_MAPPER_KEY'],
      startcoord: location_to_string(startcoord),
      endcoord: location_to_string(endcoord),
      time: Time.now.iso8601,
      time_type: 'departure'
    } }
  end

  def location_to_string(array)
    array.join(',')
  end

end
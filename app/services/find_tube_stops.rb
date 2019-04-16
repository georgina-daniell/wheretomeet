require 'google_places'

class FindTubeStops
  def find_it(l, radius, max_number)
    response = client.spots(l[0], l[1], radius: radius, types: ['subway_station', 'train_station'])
    result = response.first(max_number).map do |place|
      { location: [place['lat'], place['lng']], name: place['name'] }
    end
    result
  end

  def client
    @client ||= GooglePlaces::Client.new(ENV.fetch('GOOGLE_PLACES_KEY'))
  end
end
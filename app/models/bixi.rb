class Bixi < ApplicationRecord
  
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode, if: ->(obj){ not obj.address.present? or obj.address_changed? }  # auto-fetch address and prevent unnecessary recalculation
  
  # État des stations BIXI au format XML ### on utilise XML car le lien pour le format json était brisé lors de la création de l'application -- PIERREV
  # URL: https://montreal.bixi.com/data/bikeStations.xml
  #
  # station_id: identifiant unique de la station (is named "id" in bikeStations.xml, RENAMED to prevent conflict in database)
  # name: Nom de la station
  # terminalName: identifiant du terminal de la station
  # lastCommWithServer: horodatage de la dernière communication avec le serveur en nombres de millisecondes depuis le 1 janvier 1970.
  # lat: latitude de la station selon le référentiel géodésique WGS84
  # long: longitude de la station selon le référentiel géodésique WGS84
  # installed: valeur booléenne (true ou false) spécifiant si la station est installée.
  # locked: valeur booléenne (true ou false) spécifiant si la station est temporairement désactivée.
  # installDate: date d'installation
  # removalDate: date de retrait
  # temporary: valeur booléenne (true ou false) spécifiant s'il s'agit d'une station temporaire.
  # public: valeur booléenne (true ou false) spécifiant si l'enregistrement est public.
  # nbBikes: Nombre de vélos disponibles à cette station
  # nbEmptyDocks: Nombre de bornes disponibles pour accueillir des vélos
  # lastUpdateTime: horodatage de la dernière mise à jour des données en nombres de millisecondes depuis le 1 janvier 1970.

  ##### terminal command
  # rails generate scaffold Bixi station_id:string name:string terminalName:string lastCommWithServer:string lat:string long:string installed:string locked:string installDate:string  removalDate:string temporary:string public:string nbBikes:string nbEmptyDocks:string lastUpdateTime:string 


  def self.update_bike_stations_status

    require 'net/http' 
    xml_content = Net::HTTP.get(URI.parse(BIKE_STATIONS_URL))
    data = Hash.from_xml(xml_content)
    
    ##### for efficiency, data must be persisted (We should not parse all stations at each HTTP call)
    last_update = Time.at(data['stations']['LastUpdate'].to_f/1000).utc
    bike_updated_at = closest_available_bike.updated_at

    if last_update > bike_updated_at
      ### LOOP to update or create the bike stations records in database for persistance
      data['stations']['station'].each do |station|
        self.connection
        bixi_station = self.find_or_initialize_by(terminalName: station['terminalName'])
        bixi_station.update_attributes(
        :station_id => station["id"],
        :name => station["name"],
        :distance => distance_from_fxinnovation(station["lat"], station["long"]),
        :terminalName => station["terminalName"],
        :lastCommWithServer => station["lastCommWithServer"],
        :latitude => station["lat"],
        :longitude => station["long"],
        :installed => station["installed"],
        :locked => station["locked"],
        :installDate => station["installDate"],
        :removalDate => station["removalDate"],
        :temporary => station["temporary"],
        :public => station["public"],
        :nbBikes => station["nbBikes"],
        :nbEmptyDocks => station["nbEmptyDocks"],
        :lastUpdateTime => station["lastUpdateTime"],
        :updated_at => Time.now
        )
      end
    end
     
  end
  


  
  def self.closest_available_bike
    self.all.order(:distance).first    
    #  closest_bike_station = 0
    #  distance_min = 10000
    #  self.all.each do |bixi|
    #    if bixi.distance < distance_min and bixi.nbBikes > 0
    #      distance_min = bixi.distance
    #      closest_bike_station = bixi
    #    end
    #  end
    # closest_bike_station
  end
  
  
  
  
  def self.distance_from_fxinnovation(latitude, longitude)    
    Geocoder::Calculations.distance_between([latitude, longitude], [FX_INNOVATION_LATITUDE,FX_INNOVATION_LONGITUDE], {:units => :km})
  end
  
  
  
  

end

class Bixi < ApplicationRecord
  
  # État des stations BIXI au format XML ### le lien pour le format json était brisé lors de la création de l'application -- PIERREV
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

  def update_bike_stations_status

    require 'net/http' 
    xml_content = Net::HTTP.get(URI.parse(BIKE_STATIONS_URL))
    data = Hash.from_xml(xml_content)

    # puts data['stations']['LastUpdate'].inspect
    # puts data['stations']['station'].count.inspect
    ### LOOP to update or create the bike stations records in database for persistance    
    data['stations']['station'].each do |station|
      # puts station['terminalName']
        self.connection
        bixi_station = Bixi.find_or_initialize_by(terminalName: station['terminalName'])
        # bixi_station.inspect
        bixi_station.update_attributes(
            :station_id => station["id"],
            :name => station["name"],
            :terminalName => station["terminalName"],
            :lastCommWithServer => station["lastCommWithServer"],
            :lat => station["lat"],
            :long => station["long"],
            :installed => station["installed"],
            :locked => station["locked"],
            :installDate => station["installDate"],
            :removalDate => station["removalDate"],
            :temporary => station["temporary"],
            :public => station["public"],
            :nbBikes => station["nbBikes"],
            :nbEmptyDocks => station["nbEmptyDocks"],
            :lastUpdateTime => station["lastUpdateTime"]
        )
    end
      
  end

end




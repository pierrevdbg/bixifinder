json.extract! bixi, :id, :station_id, :name, :terminalName, :lastCommWithServer, :lat, :long, :installed, :locked, :installDate, :removalDate, :temporary, :public, :nbBikes, :nbEmptyDocks, :lastUpdateTime, :created_at, :updated_at
json.url bixi_url(bixi, format: :json)

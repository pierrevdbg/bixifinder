class CreateBixis < ActiveRecord::Migration[5.1]
  def change
    create_table :bixis do |t|
      t.string :station_id
      t.string :name
      t.string :terminalName
      t.string :lastCommWithServer
      t.string :lat
      t.string :long
      t.string :installed
      t.string :locked
      t.string :installDate
      t.string :removalDate
      t.string :temporary
      t.string :public
      t.string :nbBikes
      t.string :nbEmptyDocks
      t.string :lastUpdateTime

      t.timestamps
    end
  end
end

class CreateBixis < ActiveRecord::Migration[5.1]
  def change
    create_table :bixis do |t|
      t.integer :station_id
      t.string :name
      t.integer :terminalName
      t.date :lastCommWithServer
      t.float :latitude
      t.float :longitude
      t.boolean :installed
      t.boolean :locked
      t.date :installDate
      t.date :removalDate
      t.boolean :temporary
      t.boolean :public
      t.integer :nbBikes
      t.integer :nbEmptyDocks
      t.date :lastUpdateTime
      t.timestamps
    end
  end
end

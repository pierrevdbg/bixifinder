class AddColumnToBixis < ActiveRecord::Migration[5.1]
  def change
    add_column :bixis, :station_id, :string
    add_column :bixis, :name, :string
    add_column :bixis, :terminalName, :string
    add_column :bixis, :lastCommWithServer, :string
    add_column :bixis, :lat, :string
    add_column :bixis, :long, :string
    add_column :bixis, :installed, :string
    add_column :bixis, :locked, :string
    add_column :bixis, :installDate, :string
    add_column :bixis, :removalDate, :string
    add_column :bixis, :temporary, :string
    add_column :bixis, :public, :string
    add_column :bixis, :nbBikes, :string
    add_column :bixis, :nbEmptyDocks, :string
    add_column :bixis, :lastUpdateTime, :string
  end
end

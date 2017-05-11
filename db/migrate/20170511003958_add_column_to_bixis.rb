class AddColumnToBixis < ActiveRecord::Migration[5.1]
  def change
    add_column :bixis, :address, :string
    add_column :bixis, :distance, :float   
  end
end

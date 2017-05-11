class AddColumnToBixis < ActiveRecord::Migration[5.1]
  def change
    add_column :bixis, :address, :string
  end
end

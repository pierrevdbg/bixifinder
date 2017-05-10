class CreateBixis < ActiveRecord::Migration[5.1]
  def change
    create_table :bixis do |t|

      t.timestamps
    end
  end
end

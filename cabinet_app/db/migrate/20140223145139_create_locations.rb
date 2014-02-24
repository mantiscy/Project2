class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.string :pwd
      t.string :address

      t.timestamps
    end
  end
end

class CreateHouseinfos < ActiveRecord::Migration[5.2]
  def change
    create_table :houseinfos do |t|
      t.string :name
      t.integer :rent
      t.string :address
      t.integer :age
      t.text :note

      t.timestamps
    end
  end
end

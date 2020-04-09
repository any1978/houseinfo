class CreateNearstations < ActiveRecord::Migration[5.2]
  def change
    create_table :nearstations do |t|
      t.string :routename
      t.string :station
      t.integer :minutes
      t.references :houseinfo, foreign_key: true

      t.timestamps
    end
  end
end

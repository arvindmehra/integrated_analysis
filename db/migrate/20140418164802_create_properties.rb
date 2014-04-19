class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :photo
      t.text :project
      t.string :area
      t.string :city
      t.datetime :posted_at
      t.string :price
      t.string :size
      t.integer :to_do
      t.string :contact
      t.integer :professional_type
      t.string :data_available
      t.integer :listing_amenities
      t.integer :building_amenities
      t.text :comments
      t.string :name
      t.string :company
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end

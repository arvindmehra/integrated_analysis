class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :photo
      t.text :project
      t.string :area
      t.string :city
      t.datetime :posted_at
      t.string :price
      t.float :sizes
      t.integer :to_do
      t.integer :contact

      t.timestamps
    end
  end
end

class AddAddressToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :address_line_1, :string
  	add_column :properties, :address_line_2, :string
  end
end

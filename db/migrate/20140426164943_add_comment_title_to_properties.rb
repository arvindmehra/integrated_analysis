class AddCommentTitleToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :price_text, :integer
    add_column :properties, :comment_title, :string
  end
end

class AddSlugToDrinks < ActiveRecord::Migration[5.0]
  def change
  	add_column :drinks, :slug, :string
  	add_index :drinks, :slug, unique: true
  end
end

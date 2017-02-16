class AddSourceToDrinks < ActiveRecord::Migration[5.0]
  def change
    add_column :drinks, :source, :string
  end
end

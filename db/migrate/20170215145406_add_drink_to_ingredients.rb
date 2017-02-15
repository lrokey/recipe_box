class AddDrinkToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_reference :ingredients, :drink, foreign_key: true
  end
end

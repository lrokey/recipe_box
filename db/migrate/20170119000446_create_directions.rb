class CreateDirections < ActiveRecord::Migration[5.0]
  def change
    create_table :directions do |t|
      t.text :step
      t.belongs_to :recipe, foreign_key: true
      t.belongs_to :drink, foreign_key: true
      t.timestamps
    end
  end
end

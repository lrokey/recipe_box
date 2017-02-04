class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.references :category, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end

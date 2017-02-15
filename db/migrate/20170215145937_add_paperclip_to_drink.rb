class AddPaperclipToDrink < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :drinks, :image
  end
end

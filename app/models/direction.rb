class Direction < ApplicationRecord
  belongs_to :recipe, required: false
  belongs_to :drink, required: false
end

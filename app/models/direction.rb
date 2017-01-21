class Direction < ApplicationRecord
  belongs_to :recipe, required: false
end

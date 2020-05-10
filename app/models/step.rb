class Step < ApplicationRecord
  belongs_to :recipe, inverse_of: :steps
end

class Player < ApplicationRecord
  validates :ally_code, presence: true
  validates :ally_code, length: { is: 9 }
  validates :ally_code, numericality: { only_integer: true }
end

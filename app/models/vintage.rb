class Vintage < ApplicationRecord
  belongs_to :wine

  validates :year, numericality: { only_integer: true, allow_nil: true }
  validates :stock, numericality: { only_integer: true, allow_nil: true }
end

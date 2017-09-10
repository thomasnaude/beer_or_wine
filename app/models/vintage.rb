class Vintage < ApplicationRecord
  belongs_to :wine

  validates :year, numericality: { only_integer: true, allow_nil: true },
                   uniqueness: { scope: :wine }
  validates :stock, numericality: { only_integer: true, allow_nil: true }

  scope :ranked, -> { order(year: :asc) }
end

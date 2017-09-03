class Wine < ApplicationRecord
  include PgSearch
  multisearchable against: [:name, :appellation]
  has_attachment :photo
  belongs_to :user

  def self.colors
    %w(rouge blanc rosé)
  end

  validates :name, presence: { allow_blank: false }
  validates :country, inclusion: { in: ISO3166::Country.codes, allow_nil: true }
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5, allow_nil: true }
  validates :year, numericality: { only_integer: true, allow_nil: true }
  validates :stock, numericality: { only_integer: true, allow_nil: true }
  validates :color, inclusion: { in: self.colors, allow_nil: true }
end

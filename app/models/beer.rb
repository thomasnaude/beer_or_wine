class Beer < ApplicationRecord
  has_attachment :photo

  STYLES_FILEPATH = Rails.root.join('data', 'beer_styles.yml')

  def self.styles
    YAML.load_file(STYLES_FILEPATH)
  end

  validates :name, presence: { allow_blank: false }
  validates :style, inclusion: { in: self.styles, allow_nil: true }
  validates :country, inclusion: { in: ISO3166::Country.codes, allow_nil: true }
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  def self.color_codes
    [
      '#C04800', '#D86000', '#D87800', '#F09000', '#F79400', '#D8D8C0', '#A86048', '#904830',
      '#783030', '#903030', '#A84800', '#A83000', '#903018', '#901800', '#781800', '#F5DF86',
      '#F0D860', '#F1D744', '#E7CA55', '#F09000', '#D87818', '#D86018', '#C06018', '#C04818',
      '#001818', '#303030', '#483030', '#C09048', '#786048', '#F0F0C0', '#F7E291', '#F0D878',
      '#F0C030'
    ]
  end

  def pretty_country
    ISO3166::Country[country].translation(I18n.locale)
  end

  def rated?
    rating.present?
  end
end

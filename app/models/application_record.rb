class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def pretty_country
    ISO3166::Country[country].translation(I18n.locale)
  end


  def rated?
    rating.present?
  end
end

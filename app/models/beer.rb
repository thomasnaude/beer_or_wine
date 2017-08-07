class Beer < ApplicationRecord
    validates :name, presence: { allow_blank: false }
end

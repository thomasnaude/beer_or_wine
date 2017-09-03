class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  has_many :wines, dependent: :destroy
  has_many :beers, dependent: :destroy
end

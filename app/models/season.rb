class Season < ApplicationRecord
  has_many :season_contestants
  has_many :contestants, through: :season_contestants
end

class SeasonContestant < ApplicationRecord
  belongs_to :contestant
  belongs_to :season

  default_scope { order(place: :desc) }
end

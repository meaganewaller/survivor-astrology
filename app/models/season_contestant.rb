class SeasonContestant < ApplicationRecord
  belongs_to :contestant
  belongs_to :season
end

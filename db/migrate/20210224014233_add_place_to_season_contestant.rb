class AddPlaceToSeasonContestant < ActiveRecord::Migration[6.1]
  def change
    add_column :season_contestants, :place, :integer
  end
end

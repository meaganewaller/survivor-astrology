class CreateSeasons < ActiveRecord::Migration[6.1]
  def change
    create_table :seasons do |t|
      t.string :name
      t.integer :season_number

      t.timestamps
    end
  end
end

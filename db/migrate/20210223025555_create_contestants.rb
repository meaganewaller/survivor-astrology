class CreateContestants < ActiveRecord::Migration[6.1]
  def change
    create_table :contestants do |t|
      t.string :name
      t.string :birthday
      t.string :sun_sign

      t.timestamps
    end
  end
end

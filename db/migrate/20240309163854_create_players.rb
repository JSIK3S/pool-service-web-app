class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :ally_code

      t.timestamps
    end
  end
end

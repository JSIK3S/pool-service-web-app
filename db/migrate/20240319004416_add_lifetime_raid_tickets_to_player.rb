class AddLifetimeRaidTicketsToPlayer < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :lifetime_raid_tickets, :integer
  end
end

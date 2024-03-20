class SetDefaultValueForLifetimeRaidTickets < ActiveRecord::Migration[7.0]
  def change
    change_column_default :players, :lifetime_raid_tickets, 100
  end
end

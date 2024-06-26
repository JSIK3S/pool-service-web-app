class Player < ApplicationRecord
  validates :ally_code, presence: true
  validates :ally_code, length: { is: 9 }
  validates :ally_code, numericality: { only_integer: true }
  validates :lifetime_raid_tickets, numericality: { only_integer: true }

  def get_player_data(player_id)
    uri = URI("https://swgoh.gg/api/player/#{player_id}/")
    response = Net::HTTP.get(uri)
    json_response = JSON.parse(response)
    return json_response
  rescue StandardError => e
    puts "An error occurred: #{e}"
    return nil
  end

  def get_days_in_guild(player)
    now = Date.today
    date_joined = player.created_at.to_date
    days = (now - date_joined).to_i
    return (days == 0) ? 1 : days
  end

  def get_daily_raid_tickets(player, lifetime_raid_tickets)
    lifetime_raid_tickets / get_days_in_guild(player)
  end
end

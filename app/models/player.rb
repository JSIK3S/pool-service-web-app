class Player < ApplicationRecord
  validates :ally_code, presence: true
  validates :ally_code, length: { is: 9 }
  validates :ally_code, numericality: { only_integer: true }

  def get_player_data(player_id)
    uri = URI("https://swgoh.gg/api/player/#{player_id}/")
    response = Net::HTTP.get(uri)
    json_response = JSON.parse(response)
    return json_response
  rescue StandardError => e
    puts "An error occurred: #{e}"
    return nil
  end
end

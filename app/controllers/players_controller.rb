require 'net/http'
require 'json'

class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @boot_status = should_we_boot(@player)
  end

  def edit
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to @player, notice: "Player add to the Guild!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to @player, notice: "Player has been updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_url, status: :see_other, alert: "Player has been removed!"
  end

  private

  def player_params
    params.require(:player).
      permit(:ally_code, :lifetime_raid_tickets)
  end

  def should_we_boot(player)
    lifetime_raid_tickets = player.lifetime_raid_tickets
    if player.get_daily_raid_tickets(player, lifetime_raid_tickets) < 200
      'BOOT!'
    else
      'Keep!'
    end
  end
end

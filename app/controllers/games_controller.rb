class GamesController < ApplicationController
  def index
    @games = Game.all.limit(10)
  end

  def show
    @game = Game.find(params[:id])
  end
end

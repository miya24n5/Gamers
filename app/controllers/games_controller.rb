class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save
      redirect_to game_path(@game)
    else
      render new
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render show
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to index
  end


  private

  def game_params
    params.require(:game).permit(:title, :body, :star)
  end

end

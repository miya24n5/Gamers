class GamesController < ApplicationController

  before_action :authenticate_user!, except: [:index]


  def new
    @game = Game.new
  end

  def index
    @games = Game.page(params[:page]).per(9)
  end

  def show
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
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
      render new_game_path
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render game_path(@game)
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end


  private

  def game_params
    params.require(:game).permit(:title, :body, :star, tag_ids: [])
  end

end

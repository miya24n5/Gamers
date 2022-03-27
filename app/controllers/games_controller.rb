class GamesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  # ↓URL直打ち防止の記述
  before_action :correct_game,only: [:edit]


  def new
    @game = Game.new
  end

  def index
    # タグに関する記述
    @tags = Tag.all
    games = params[:name].present? ? Tag.find(params[:name]).games : Game.all
    @games = games.page(params[:page]).per(9)
  end

  def show
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
  end

  def edit
    @game = Game.find(params[:id])
    @game.user_id = current_user.id
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
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  # 一番上で書いたものに対しての記述、これを追加するとURL直打ち不可
  def correct_game
    @game = Game.find(params[:id])
    unless @game.user.id == current_user.id
      redirect_to games_path
    end
  end


  private

  def game_params
    params.require(:game).permit(:title, :body, :star, tag_ids: [])
  end

end

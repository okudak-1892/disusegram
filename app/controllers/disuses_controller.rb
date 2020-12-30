class DisusesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def new
    @disuse = Disuse.new
  end

  def create
    @disuse = current_user.disuses.build(disuse_params)
    if @disuse.save
      redirect_to disuse_path(@disuse), notice: "不用品を投稿しました。"
    else
      render :new
    end
  end

  def index
    @disuses = Disuse.all.order(id: "DESC")
  end

  def show
    @disuse = Disuse.find(params[:id])
  end

  def edit
    @disuse = Disuse.find(params[:id])
    if @disuse.user != current_user
        redirect_to disuses_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @disuse = Disuse.find(params[:id])
    if @disuse.update(disuse_params)
      redirect_to disuse_path(@disuse), notice: "不用品を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    disuse = Disuse.find(params[:id])
    disuse.destroy
    redirect_to user_path(disuse.user), notice: "不用品を削除しました。"
  end

  private
  def disuse_params
    params.require(:disuse).permit(:title, :body, :image, :comment)
  end
end

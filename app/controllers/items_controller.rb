class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.new
  end


  #以下はActive Storage導入時に追加したもの
  private

  def item_params
    params.require(:item).permit(:image, :title, :concept, :category_id, :status_id, :fee_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
  #ここまで
  #保存以降は後ほど実装予定
end

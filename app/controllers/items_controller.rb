class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user == current_user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
   else
     render :edit
   end
 end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  #以下はActive Storage導入時に追加したもの
  private

  def item_params
    params.require(:item).permit(:image, :title, :concept, :category_id, :status_id, :fee_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  # def message_params
  #   params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  # end
  #ここまで
  #保存以降は後ほど実装予定
end

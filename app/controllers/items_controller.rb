class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:edit, :update, :show ]
  before_action :user_authentication, only: [:edit, :update, :delete]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
   else
     render :new
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
  end


  private

  def item_params
    params.require(:item).permit(:image, :title, :concept, :category_id, :status_id, :fee_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
  
  def user_authentication
    unless @item.user == current_user
      redirect_to root_path
    end
  end

end

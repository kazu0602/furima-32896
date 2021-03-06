class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item
  before_action :user_authentication

  def index
    @furima_registration = FurimaRegistration.new
  end

  def create
    @furima_registration = FurimaRegistration.new(donation_params) # フォームオブジェクトのモデルからインスタンスを生成する。
    if @furima_registration.valid? # form objectにより、購入履歴とアドレス情報を保存する処理。
      pay_item
      @furima_registration.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def donation_params
    params.require(:furima_registration).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
   
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] 
    Payjp::Charge.create(
      amount: @item.price, 
      card: donation_params[:token], 
      currency: 'jpy'                
    )
  end

  def user_authentication
    redirect_to root_path if @item.user == current_user || @item.purchase.present?
  end
end

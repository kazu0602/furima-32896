class OrdersController < ApplicationController

  before_action :find_item, only: [:index, :new, :create ]

  def index
    @furima_registration = FurimaRegistration.new
  end

  def new
  end

  def create
    
    @furima_registration = FurimaRegistration.new(donation_params)#フォームオブジェクトのモデルからインスタンスを生成する。
 
      if @furima_registration.valid? #form objectにより、購入履歴とアドレス情報を保存する処理。
         @furima_registration.save
        redirect_to root_path
      else
        render action: :index
      end
  end

    private

     def donation_params
       params.require(:furima_registration).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
       #hogeを追加した。
     end

    def find_item
      @item = Item.find(params[:item_id])
    end

end

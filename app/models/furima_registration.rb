class FurimaRegistration
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token
  #上記にカード番号も含まれるかは後ほど考えるようにする。

with_options presence: true do
  validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
  #メッセージ部分を削除した。  { with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :phone_number, format: { with: /\A\d{10,11}\z/}
  #メッセージ部分を削除した。numericality: { other_than: 0, message: "can't be blank" }
  end

  with_options presence: true do
    validates :postcode
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number
    validates :token
    validates :user_id
    validates :item_id
    end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    #購入履歴のテーブルへ保存する処理を記述する。
    Address.create(purchase_id: purchase.id, postcode: postcode , prefecture: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
  end

  extend ActiveHash::Associations::ActiveRecordExtensions

end

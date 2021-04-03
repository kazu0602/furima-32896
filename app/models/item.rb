class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :purchases
  PRICE_REGEX = /\A[0-9]+\z/

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :status
  belongs_to :delivery_date
  #Activehashのassociationを組んだ

  #空の投稿を保存できないようにする
 with_options presence: true do
  validates :title
  validates :fee
  validates :concept
  validates :prefecture_id
  validates :status_id
  validates :delivery_date_id
  validates :category_id
  validates :price, format: { with: PRICE_REGEX }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  validates :image
 end
  #上記の書き方は正しいのかは不明。

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :prefecture_id
  validates :status_id
  validates :delivery_date_id
  validates :fee_id
  end
end

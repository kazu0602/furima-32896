class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  PRICE_REGEX = /\A[0-9]+\z/

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :status
  belongs_to :delivery_date
  #Activehashのassociationを組んだ

  #空の投稿を保存できないようにする
  validates :title, presence: true
  validates :fee, presence: true
  validates :prefecture_id, presence: true
  validates :status_id, presence: true
  validates :delivery_date_id, presence: true
  validates :category_id, presence: true
  validates :price, presence: true, format: { with: PRICE_REGEX }

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_date_id, numericality: { other_than: 1 }

end

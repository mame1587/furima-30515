class Item < ApplicationRecord

validates :user, presence: true
validates :name, presence: true
validates :description, presence: true
validates :category_id, presence: true
validates :condition_id, presence: true
validates :postage_payer_id, presence: true
validates :prefecture_id, presence: true
validates :handling_id, presence: true
validates :price, presence: true


has_one :orders
belongs_to :user
has_one_attached :image
end

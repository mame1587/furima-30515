class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
has_one :orders
belongs_to :user
has_one_attached :image

def was_attached?
  self.image.attached?
end


   validates :name, presence: true
   validates :description, presence: true
   validates :category_id, numericality: {other_than:1}
   validates :condition_id, numericality: {other_than:1}
   validates :postage_payer_id, numericality: {other_than:1}
   validates :prefecture_id, numericality: {other_than:1}
   validates :handling_id, numericality: {other_than:1}
   validates :price, presence: true
   validates :price, inclusion: {in: 300..9999999 } 
   validates :image, presence: true

end

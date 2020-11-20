class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
has_one :orders
belongs_to :user
has_one_attached :image
belongs_to :condition
belongs_to :prefecture
belongs_to :postage_payer
belongs_to :handling

def was_attached?
  self.image.attached?
end


    validates :name, presence: true
    validates :description, presence: true
   with_options numericality: {other_than:1} do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :handling_id
   end
    validates :price, presence: true
    validates :price, inclusion: {in: 300..9999999 } 
    validates :image, presence: true

end

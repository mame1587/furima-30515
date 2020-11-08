class Item < ApplicationRecord
has_one :orders
belongs_to :user
end

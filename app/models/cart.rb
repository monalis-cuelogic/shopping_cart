class Cart < ApplicationRecord
	belongs_to :user
	validates :product_id, uniqueness: true
end

class Product < ApplicationRecord
  belongs_to :brand
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  paginates_per 6
  validates :name, :price, :quantity, :description, :brand_id, :images, :presence => true
  validates :name, uniqueness: true
end

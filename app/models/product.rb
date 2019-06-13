class Product < ApplicationRecord
  belongs_to :brand
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  paginates_per 6
  validates :name, :price, :quantity, :description, :brand_id, :presence => true
  validates :name, uniqueness: true
  validates_numericality_of :quantity, :greater_than_or_equal_to => 0
end

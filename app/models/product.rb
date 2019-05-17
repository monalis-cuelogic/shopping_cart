class Product < ApplicationRecord
  belongs_to :brand
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  paginates_per 5
end
